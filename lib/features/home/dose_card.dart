import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/db.dart';
import '../../theme/tokens.dart';

enum DoseCardVariant { standard, nextUp, overdue, completed }

/// B1/A5 DoseCard. [medication] may be null if the med was archived.
class DoseCard extends StatelessWidget {
  const DoseCard({
    super.key,
    required this.dose,
    required this.medication,
    required this.variant,
    this.onTake,
    this.onSkip,
    this.onSnooze,
  });

  final DoseInstance dose;
  final Medication? medication;
  final DoseCardVariant variant;
  final VoidCallback? onTake;
  final VoidCallback? onSkip;
  final VoidCallback? onSnooze;

  @override
  Widget build(BuildContext context) {
    final med = medication;
    final name = med == null
        ? 'Medication'
        : '${med.name}${med.strength.isEmpty ? '' : ' ${med.strength}'}';
    final time = DateFormat.jm().format(dose.scheduledAt);
    final completed = variant == DoseCardVariant.completed;

    final card = Container(
      padding: const EdgeInsets.all(AppSpace.s4),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary.resolveFrom(context),
        borderRadius: BorderRadius.circular(AppRadius.m),
        border: variant == DoseCardVariant.overdue
            ? Border(
                left: BorderSide(
                  color: AppColors.warning.resolveFrom(context),
                  width: 3,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.tint12.resolveFrom(context),
              borderRadius: BorderRadius.circular(AppRadius.s),
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
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary.resolveFrom(context),
                  ),
                ),
                if (med != null && med.instructions.isNotEmpty) ...[
                  const SizedBox(height: AppSpace.s1),
                  Text(
                    med.instructions,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textSecondary.resolveFrom(context),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpace.s3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 15,
                  fontFeatures: const [FontFeature.tabularFigures()],
                  color: variant == DoseCardVariant.overdue
                      ? AppColors.warning.resolveFrom(context)
                      : AppColors.textSecondary.resolveFrom(context),
                ),
              ),
              const SizedBox(height: AppSpace.s2),
              if (completed)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_circle_fill,
                      size: 22,
                      color: AppColors.primary.resolveFrom(context),
                    ),
                    if (dose.actionAt != null) ...[
                      const SizedBox(width: AppSpace.s1),
                      Text(
                        DateFormat.jm().format(dose.actionAt!),
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textTertiary.resolveFrom(context),
                        ),
                      ),
                    ],
                  ],
                )
              else
                _TakeButton(onPressed: onTake),
            ],
          ),
        ],
      ),
    );

    if (completed) return Opacity(opacity: 0.6, child: card);
    if (onSkip == null && onSnooze == null) return card;

    return GestureDetector(
      onLongPress: () => _showActions(context),
      child: card,
    );
  }

  void _showActions(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(medication?.name ?? 'Dose'),
        actions: [
          if (onTake != null)
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(sheetContext);
                onTake!();
              },
              child: const Text('Take now'),
            ),
          if (onSnooze != null)
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(sheetContext);
                onSnooze!();
              },
              child: const Text('Snooze 10 min'),
            ),
          if (onSkip != null)
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(sheetContext);
                onSkip!();
              },
              child: const Text('Skip'),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}

class _TakeButton extends StatelessWidget {
  const _TakeButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: const Size(AppLayout.minTap, AppLayout.minTap),
      onPressed: onPressed,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.s4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.resolveFrom(context),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: const Text(
          'Take',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
