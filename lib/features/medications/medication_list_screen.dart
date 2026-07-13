import 'package:flutter/cupertino.dart';

import '../../core/app_services.dart';
import '../../data/db.dart';
import '../../data/models.dart';
import '../../theme/tokens.dart';
import 'medication_form_screen.dart';

class MedicationListScreen extends StatefulWidget {
  const MedicationListScreen({super.key, this.openAddOnLaunch = false});

  final bool openAddOnLaunch;

  @override
  State<MedicationListScreen> createState() => _MedicationListScreenState();
}

class _MedicationListScreenState extends State<MedicationListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.openAddOnLaunch) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _openForm());
    }
  }

  Future<void> _openForm([Medication? med]) async {
    await Navigator.of(context).push(
      CupertinoPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => MedicationFormScreen(existing: med),
      ),
    );
  }

  Future<void> _confirmArchive(Medication med) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text('Remove ${med.name}?'),
        content: const Text(
            'Upcoming doses are removed. Past history is kept.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await appDb.archiveMedication(med.id);
      await refreshDosesAndReminders();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgBase.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Medications'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: const Size(AppLayout.minTap, AppLayout.minTap),
          onPressed: () => _openForm(),
          child: const Icon(CupertinoIcons.add, size: 24),
        ),
      ),
      child: SafeArea(
        child: StreamBuilder<List<Medication>>(
          stream: appDb.watchActiveMedications(),
          builder: (context, snap) {
            final meds = snap.data ?? const <Medication>[];
            if (meds.isEmpty) {
              return Center(
                child: Text(
                  'No medications — tap + to add one.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary.resolveFrom(context),
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppLayout.margin),
              itemCount: meds.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppLayout.listGap),
              itemBuilder: (context, i) {
                final med = meds[i];
                return GestureDetector(
                  onTap: () => _openForm(med),
                  onLongPress: () => _confirmArchive(med),
                  child: Container(
                    padding: const EdgeInsets.all(AppSpace.s4),
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondary.resolveFrom(context),
                      borderRadius: BorderRadius.circular(AppRadius.m),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.tint12.resolveFrom(context),
                            borderRadius:
                                BorderRadius.circular(AppRadius.s),
                          ),
                          child: Icon(
                            CupertinoIcons.capsule_fill,
                            size: 22,
                            color: AppColors.primary.resolveFrom(context),
                          ),
                        ),
                        const SizedBox(width: AppSpace.s3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${med.name}'
                                '${med.strength.isEmpty ? '' : ' ${med.strength}'}',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary
                                      .resolveFrom(context),
                                ),
                              ),
                              const SizedBox(height: AppSpace.s1),
                              Text(
                                '${med.form.label} · ${_scheduleSummary(med)}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.textSecondary
                                      .resolveFrom(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          CupertinoIcons.chevron_right,
                          size: 18,
                          color: AppColors.textTertiary.resolveFrom(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  static String _scheduleSummary(Medication med) {
    final n = med.doseTimes.split(',').where((t) => t.isNotEmpty).length;
    return switch (med.scheduleType) {
      ScheduleType.timesOfDay => '$n× daily',
      ScheduleType.interval => 'every ${med.intervalHours} h',
      ScheduleType.weekdays => '$n× on selected days',
    };
  }
}
