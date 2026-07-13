import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../theme/tokens.dart';

/// Grouped form card (A5 FieldRow container).
class FormCard extends StatelessWidget {
  const FormCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      rows.add(children[i]);
      if (i < children.length - 1) {
        rows.add(Container(
          margin: const EdgeInsets.only(left: AppSpace.s4),
          height: 0.5,
          color: AppColors.separator.resolveFrom(context),
        ));
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSecondary.resolveFrom(context),
        borderRadius: BorderRadius.circular(AppRadius.m),
      ),
      child: Column(children: rows),
    );
  }
}

class _RowShell extends StatelessWidget {
  const _RowShell({required this.label, required this.child, this.onTap});

  final String label;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final row = Container(
      constraints: const BoxConstraints(minHeight: 52),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s4),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 17,
                  color: AppColors.textPrimary.resolveFrom(context))),
          const SizedBox(width: AppSpace.s3),
          Expanded(child: child),
        ],
      ),
    );
    if (onTap == null) return row;
    return GestureDetector(
        behavior: HitTestBehavior.opaque, onTap: onTap, child: row);
  }
}

class FormTextRow extends StatelessWidget {
  const FormTextRow({
    super.key,
    required this.label,
    required this.controller,
    this.placeholder,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return _RowShell(
      label: label,
      child: CupertinoTextField.borderless(
        controller: controller,
        placeholder: placeholder,
        textAlign: TextAlign.right,
        onChanged: onChanged,
        style: TextStyle(
            fontSize: 17,
            color: AppColors.textSecondary.resolveFrom(context)),
      ),
    );
  }
}

class FormPickerRow extends StatelessWidget {
  const FormPickerRow({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onSelected,
    this.initialIndex = 0,
  });

  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<int> onSelected;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return _RowShell(
      label: label,
      onTap: () => _show(context),
      child: Text(value,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 17,
              color: AppColors.textSecondary.resolveFrom(context))),
    );
  }

  void _show(BuildContext context) {
    var index = initialIndex;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => Container(
        height: 260,
        color: AppColors.bgElevated.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(children: [
            Expanded(
              child: CupertinoPicker(
                itemExtent: 36,
                scrollController:
                    FixedExtentScrollController(initialItem: initialIndex),
                onSelectedItemChanged: (i) => index = i,
                children: [for (final o in options) Center(child: Text(o))],
              ),
            ),
            CupertinoButton(
              onPressed: () {
                onSelected(index);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ]),
        ),
      ),
    );
  }
}

class FormTimeRow extends StatelessWidget {
  const FormTimeRow({
    super.key,
    required this.label,
    required this.minutes,
    required this.onChanged,
    this.onRemove,
  });

  final String label;
  final int minutes;
  final ValueChanged<int> onChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final time = DateTime(2000, 1, 1, minutes ~/ 60, minutes % 60);
    return _RowShell(
      label: label,
      onTap: () => _show(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(DateFormat.jm().format(time),
              style: TextStyle(
                  fontSize: 17,
                  color: AppColors.textSecondary.resolveFrom(context))),
          if (onRemove != null)
            CupertinoButton(
              padding: const EdgeInsets.only(left: AppSpace.s2),
              minimumSize: const Size(AppLayout.minTap, AppLayout.minTap),
              onPressed: onRemove,
              child: Icon(CupertinoIcons.minus_circle,
                  size: 20, color: AppColors.sos.resolveFrom(context)),
            ),
        ],
      ),
    );
  }

  void _show(BuildContext context) {
    var picked = minutes;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: AppColors.bgElevated.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime:
                    DateTime(2000, 1, 1, minutes ~/ 60, minutes % 60),
                onDateTimeChanged: (d) => picked = d.hour * 60 + d.minute,
              ),
            ),
            CupertinoButton(
              onPressed: () {
                onChanged(picked);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ]),
        ),
      ),
    );
  }
}

class FormDateRow extends StatelessWidget {
  const FormDateRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    return _RowShell(
      label: label,
      onTap: () => _show(context),
      child: Text(
        value == null ? 'None' : DateFormat.yMMMd().format(value!),
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 17,
            color: AppColors.textSecondary.resolveFrom(context)),
      ),
    );
  }

  void _show(BuildContext context) {
    var picked = value ?? DateTime.now().add(const Duration(days: 7));
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => Container(
        height: 320,
        color: AppColors.bgElevated.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: picked,
                minimumDate: DateTime.now(),
                maximumDate:
                    DateTime.now().add(const Duration(days: 365 * 5)),
                onDateTimeChanged: (d) => picked = d,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CupertinoButton(
                onPressed: () {
                  onChanged(null);
                  Navigator.pop(context);
                },
                child: const Text('Clear'),
              ),
              CupertinoButton(
                onPressed: () {
                  onChanged(picked);
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

class WeekdayPickerRow extends StatelessWidget {
  const WeekdayPickerRow({
    super.key,
    required this.mask,
    required this.onChanged,
  });

  final int mask;
  final ValueChanged<int> onChanged;

  static const _labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.s4, vertical: AppSpace.s3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < 7; i++)
            GestureDetector(
              onTap: () => onChanged(mask ^ (1 << i)),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (mask & (1 << i)) != 0
                      ? AppColors.primary.resolveFrom(context)
                      : AppColors.fillTertiary.resolveFrom(context),
                ),
                child: Text(
                  _labels[i],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: (mask & (1 << i)) != 0
                        ? AppColors.onPrimary
                        : AppColors.textSecondary.resolveFrom(context),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
