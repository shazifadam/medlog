import 'package:drift/drift.dart' show Value;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../core/app_services.dart';
import '../../data/db.dart';
import '../../data/models.dart';
import '../../theme/tokens.dart';
import '../medications/medication_list_screen.dart';
import 'dose_card.dart';

/// B1 Home — today's schedule as a checklist. Grace window before a due
/// dose counts as overdue (spec §2.5, default 60 min).
const _graceWindow = Duration(minutes: 60);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgBase.resolveFrom(context),
      child: StreamBuilder<List<Medication>>(
        stream: appDb.watchActiveMedications(),
        builder: (context, medsSnap) {
          final meds = {for (final m in medsSnap.data ?? <Medication>[]) m.id: m};
          return StreamBuilder<List<DoseInstance>>(
            stream: appDb.watchDosesBetween(startOfDay, endOfDay),
            builder: (context, dosesSnap) {
              final doses = dosesSnap.data ?? const <DoseInstance>[];
              final hasMeds = medsSnap.hasData && meds.isNotEmpty;
              return CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    largeTitle: Text(_greeting(now)),
                    middle: Text(DateFormat.MMMEd().format(now)),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minimumSize:
                          const Size(AppLayout.minTap, AppLayout.minTap),
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => const MedicationListScreen(),
                        ),
                      ),
                      child: const Icon(CupertinoIcons.capsule, size: 24),
                    ),
                  ),
                  if (!hasMeds)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _EmptyState(),
                    )
                  else
                    _scheduleSlivers(context, doses, meds, now),
                  const SliverPadding(
                      padding: EdgeInsets.only(bottom: 96)),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _scheduleSlivers(
    BuildContext context,
    List<DoseInstance> doses,
    Map<String, Medication> meds,
    DateTime now,
  ) {
    final upcoming =
        doses.where((d) => d.status == DoseStatus.upcoming).toList();
    final completed =
        doses.where((d) => d.status != DoseStatus.upcoming).toList();

    final overdue = upcoming
        .where((d) => now.difference(d.scheduledAt) > _graceWindow)
        .toList();
    final pending =
        upcoming.where((d) => !overdue.contains(d)).toList();
    final nextUp = pending.isEmpty ? null : pending.first;
    final later = pending.skip(1).toList();

    final children = <Widget>[
      if (overdue.isNotEmpty) ...[
        _SectionHeader('OVERDUE', color: AppColors.warning),
        for (final d in overdue)
          _dose(context, d, meds, DoseCardVariant.overdue),
      ],
      if (nextUp != null) ...[
        const _SectionHeader('NEXT UP'),
        _NextUpCard(
          countdown: _countdown(nextUp.scheduledAt, now),
          child: _dose(context, nextUp, meds, DoseCardVariant.nextUp),
        ),
      ],
      if (later.isNotEmpty) ...[
        const _SectionHeader('LATER TODAY'),
        for (final d in later)
          _dose(context, d, meds, DoseCardVariant.standard),
      ],
      if (completed.isNotEmpty) ...[
        _SectionHeader('COMPLETED (${completed.length})'),
        for (final d in completed)
          _dose(context, d, meds, DoseCardVariant.completed),
      ],
      if (upcoming.isEmpty && completed.isEmpty)
        Padding(
          padding: const EdgeInsets.only(top: AppSpace.s10),
          child: Center(
            child: Text(
              'No doses scheduled today',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary.resolveFrom(context),
              ),
            ),
          ),
        ),
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.margin),
      sliver: SliverList.list(children: children),
    );
  }

  Widget _dose(
    BuildContext context,
    DoseInstance dose,
    Map<String, Medication> meds,
    DoseCardVariant variant,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppLayout.listGap),
      child: DoseCard(
        dose: dose,
        medication: meds[dose.medicationId],
        variant: variant,
        onTake: variant == DoseCardVariant.completed
            ? null
            : () => _act(dose, meds, DoseStatus.taken, LogStatus.taken),
        onSkip: variant == DoseCardVariant.completed
            ? null
            : () => _act(dose, meds, DoseStatus.skipped, LogStatus.skipped),
        onSnooze: variant == DoseCardVariant.completed
            ? null
            : () async {
                await appDb.snoozeDose(
                    dose.id, DateTime.now().add(const Duration(minutes: 10)));
                await notifications.syncSchedules();
              },
      ),
    );
  }

  Future<void> _act(
    DoseInstance dose,
    Map<String, Medication> meds,
    DoseStatus status,
    LogStatus logStatus,
  ) async {
    final now = DateTime.now();
    await appDb.setDoseStatus(dose.id, status, actionAt: now);
    await appDb.addLogEntry(MedicationLogEntriesCompanion.insert(
      medicationId: dose.medicationId,
      medicationName: meds[dose.medicationId]?.name ?? 'Unknown',
      doseInstanceId: Value(dose.id),
      scheduledAt: Value(dose.scheduledAt),
      actualAt: now,
      status: logStatus,
    ));
    await notifications.syncSchedules();
  }

  static String _greeting(DateTime now) {
    if (now.hour < 12) return 'Good morning';
    if (now.hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  static String _countdown(DateTime at, DateTime now) {
    final diff = at.difference(now);
    if (diff.isNegative) return 'due now';
    if (diff.inMinutes < 60) return 'in ${diff.inMinutes} min';
    final h = diff.inHours;
    final m = diff.inMinutes % 60;
    return m == 0 ? 'in $h h' : 'in $h h $m min';
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title, {this.color});

  final String title;
  final CupertinoDynamicColor? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpace.s6, bottom: AppSpace.s2),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: (color ?? AppColors.textSecondary).resolveFrom(context),
        ),
      ),
    );
  }
}

/// Glass treatment comes in M5 polish — for now an elevated card with the
/// coral countdown per B1.
class _NextUpCard extends StatelessWidget {
  const _NextUpCard({required this.child, required this.countdown});

  final Widget child;
  final String countdown;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        Padding(
          padding: const EdgeInsets.only(
              left: AppSpace.s4, bottom: AppSpace.s2),
          child: Text(
            countdown,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary.resolveFrom(context),
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.capsule,
            size: 56,
            color: AppColors.textTertiary.resolveFrom(context),
          ),
          const SizedBox(height: AppSpace.s2),
          Text(
            'No medications yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary.resolveFrom(context),
            ),
          ),
          const SizedBox(height: AppSpace.s1),
          Text(
            'Add your first medication to see your schedule here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary.resolveFrom(context),
            ),
          ),
          const SizedBox(height: AppSpace.s6),
          CupertinoButton(
            color: AppColors.primary.resolveFrom(context),
            borderRadius: BorderRadius.circular(AppRadius.pill),
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (_) => const MedicationListScreen(openAddOnLaunch: true),
              ),
            ),
            child: const Text(
              'Add medication',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
