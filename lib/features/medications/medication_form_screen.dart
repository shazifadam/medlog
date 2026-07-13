import 'package:drift/drift.dart' show Value;
import 'package:flutter/cupertino.dart';

import '../../core/app_services.dart';
import '../../data/db.dart';
import '../../data/models.dart';
import '../../theme/tokens.dart';
import 'form_rows.dart';

/// B5 Medication add/edit (M1 scope — SOS toggle lands in M2).
class MedicationFormScreen extends StatefulWidget {
  const MedicationFormScreen({super.key, this.existing});

  final Medication? existing;

  @override
  State<MedicationFormScreen> createState() => _MedicationFormScreenState();
}

class _MedicationFormScreenState extends State<MedicationFormScreen> {
  late final TextEditingController _name;
  late final TextEditingController _strength;
  late final TextEditingController _instructions;
  late MedForm _form;
  late ScheduleType _scheduleType;
  late List<int> _times; // minutes since midnight
  late int _intervalHours;
  late int _weekdaysMask;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    final m = widget.existing;
    _name = TextEditingController(text: m?.name ?? '');
    _strength = TextEditingController(text: m?.strength ?? '');
    _instructions = TextEditingController(text: m?.instructions ?? '');
    _form = m?.form ?? MedForm.tablet;
    _scheduleType = m?.scheduleType ?? ScheduleType.timesOfDay;
    _times = (m?.doseTimes ?? '480')
        .split(',')
        .where((t) => t.isNotEmpty)
        .map(int.parse)
        .toList();
    if (_times.isEmpty) _times = [480];
    _intervalHours = m?.intervalHours ?? 8;
    _weekdaysMask = m?.weekdaysMask ?? 0x1F; // Mon-Fri
    _endDate = m?.endDate;
  }

  @override
  void dispose() {
    _name.dispose();
    _strength.dispose();
    _instructions.dispose();
    super.dispose();
  }

  bool get _valid => _name.text.trim().isNotEmpty;

  Future<void> _save() async {
    final m = widget.existing;
    _times.sort();
    await appDb.upsertMedication(MedicationsCompanion(
      id: m == null ? const Value.absent() : Value(m.id),
      name: Value(_name.text.trim()),
      strength: Value(_strength.text.trim()),
      form: Value(_form),
      instructions: Value(_instructions.text.trim()),
      scheduleType: Value(_scheduleType),
      doseTimes: Value(_times.join(',')),
      intervalHours: Value(
          _scheduleType == ScheduleType.interval ? _intervalHours : null),
      weekdaysMask: Value(
          _scheduleType == ScheduleType.weekdays ? _weekdaysMask : null),
      startDate: Value(m?.startDate ?? DateTime.now()),
      endDate: Value(_endDate),
      createdAt: m == null ? const Value.absent() : Value(m.createdAt),
    ));
    await refreshDosesAndReminders();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgBase.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.existing == null
            ? 'New Medication'
            : 'Edit Medication'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: const Size(AppLayout.minTap, AppLayout.minTap),
          onPressed: _valid ? _save : null,
          child: const Text('Save',
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppLayout.margin),
          children: [
            FormCard(children: [
              FormTextRow(
                label: 'Name',
                controller: _name,
                placeholder: 'Metformin',
                onChanged: (_) => setState(() {}),
              ),
              FormTextRow(
                label: 'Strength',
                controller: _strength,
                placeholder: '500 mg',
              ),
              FormPickerRow(
                label: 'Form',
                value: _form.label,
                options: [for (final f in MedForm.values) f.label],
                onSelected: (i) =>
                    setState(() => _form = MedForm.values[i]),
              ),
            ]),
            const SizedBox(height: AppSpace.s6),
            CupertinoSlidingSegmentedControl<ScheduleType>(
              groupValue: _scheduleType,
              onValueChanged: (v) =>
                  setState(() => _scheduleType = v ?? _scheduleType),
              children: const {
                ScheduleType.timesOfDay: Text('Daily'),
                ScheduleType.interval: Text('Interval'),
                ScheduleType.weekdays: Text('Weekdays'),
              },
            ),
            const SizedBox(height: AppSpace.s3),
            FormCard(children: _scheduleRows(context)),
            const SizedBox(height: AppSpace.s6),
            FormCard(children: [
              FormTextRow(
                label: 'Instructions',
                controller: _instructions,
                placeholder: 'After food',
              ),
              FormDateRow(
                label: 'End date',
                value: _endDate,
                onChanged: (d) => setState(() => _endDate = d),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  List<Widget> _scheduleRows(BuildContext context) {
    if (_scheduleType == ScheduleType.interval) {
      return [
        FormPickerRow(
          label: 'Every',
          value: '$_intervalHours hours',
          options: [for (var h = 1; h <= 24; h++) '$h hours'],
          initialIndex: _intervalHours - 1,
          onSelected: (i) => setState(() => _intervalHours = i + 1),
        ),
        FormTimeRow(
          label: 'First dose',
          minutes: _times.first,
          onChanged: (m) => setState(() => _times = [m]),
        ),
      ];
    }
    return [
      if (_scheduleType == ScheduleType.weekdays)
        WeekdayPickerRow(
          mask: _weekdaysMask,
          onChanged: (m) => setState(() => _weekdaysMask = m),
        ),
      for (var i = 0; i < _times.length; i++)
        FormTimeRow(
          label: 'Time ${i + 1}',
          minutes: _times[i],
          onChanged: (m) => setState(() => _times[i] = m),
          onRemove: _times.length > 1
              ? () => setState(() => _times.removeAt(i))
              : null,
        ),
      CupertinoButton(
        onPressed: () => setState(() => _times.add(20 * 60)),
        child: const Text('+ Add time'),
      ),
    ];
  }
}
