// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _uuid.v4,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<MedForm, String> form =
      GeneratedColumn<String>(
        'form',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MedForm>($MedicationsTable.$converterform);
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ScheduleType, String>
  scheduleType = GeneratedColumn<String>(
    'schedule_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ScheduleType>($MedicationsTable.$converterscheduleType);
  static const VerificationMeta _doseTimesMeta = const VerificationMeta(
    'doseTimes',
  );
  @override
  late final GeneratedColumn<String> doseTimes = GeneratedColumn<String>(
    'dose_times',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _intervalHoursMeta = const VerificationMeta(
    'intervalHours',
  );
  @override
  late final GeneratedColumn<int> intervalHours = GeneratedColumn<int>(
    'interval_hours',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weekdaysMaskMeta = const VerificationMeta(
    'weekdaysMask',
  );
  @override
  late final GeneratedColumn<int> weekdaysMask = GeneratedColumn<int>(
    'weekdays_mask',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSosMeta = const VerificationMeta('isSos');
  @override
  late final GeneratedColumn<bool> isSos = GeneratedColumn<bool>(
    'is_sos',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sos" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _maxPerDayMeta = const VerificationMeta(
    'maxPerDay',
  );
  @override
  late final GeneratedColumn<int> maxPerDay = GeneratedColumn<int>(
    'max_per_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minGapMinutesMeta = const VerificationMeta(
    'minGapMinutes',
  );
  @override
  late final GeneratedColumn<int> minGapMinutes = GeneratedColumn<int>(
    'min_gap_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stockCountMeta = const VerificationMeta(
    'stockCount',
  );
  @override
  late final GeneratedColumn<int> stockCount = GeneratedColumn<int>(
    'stock_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    strength,
    form,
    instructions,
    scheduleType,
    doseTimes,
    intervalHours,
    weekdaysMask,
    startDate,
    endDate,
    isSos,
    maxPerDay,
    minGapMinutes,
    stockCount,
    archivedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('dose_times')) {
      context.handle(
        _doseTimesMeta,
        doseTimes.isAcceptableOrUnknown(data['dose_times']!, _doseTimesMeta),
      );
    }
    if (data.containsKey('interval_hours')) {
      context.handle(
        _intervalHoursMeta,
        intervalHours.isAcceptableOrUnknown(
          data['interval_hours']!,
          _intervalHoursMeta,
        ),
      );
    }
    if (data.containsKey('weekdays_mask')) {
      context.handle(
        _weekdaysMaskMeta,
        weekdaysMask.isAcceptableOrUnknown(
          data['weekdays_mask']!,
          _weekdaysMaskMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('is_sos')) {
      context.handle(
        _isSosMeta,
        isSos.isAcceptableOrUnknown(data['is_sos']!, _isSosMeta),
      );
    }
    if (data.containsKey('max_per_day')) {
      context.handle(
        _maxPerDayMeta,
        maxPerDay.isAcceptableOrUnknown(data['max_per_day']!, _maxPerDayMeta),
      );
    }
    if (data.containsKey('min_gap_minutes')) {
      context.handle(
        _minGapMinutesMeta,
        minGapMinutes.isAcceptableOrUnknown(
          data['min_gap_minutes']!,
          _minGapMinutesMeta,
        ),
      );
    }
    if (data.containsKey('stock_count')) {
      context.handle(
        _stockCountMeta,
        stockCount.isAcceptableOrUnknown(data['stock_count']!, _stockCountMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      )!,
      form: $MedicationsTable.$converterform.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}form'],
        )!,
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      scheduleType: $MedicationsTable.$converterscheduleType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}schedule_type'],
        )!,
      ),
      doseTimes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_times'],
      )!,
      intervalHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_hours'],
      ),
      weekdaysMask: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekdays_mask'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      isSos: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sos'],
      )!,
      maxPerDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_per_day'],
      ),
      minGapMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_gap_minutes'],
      ),
      stockCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_count'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MedForm, String, String> $converterform =
      const EnumNameConverter<MedForm>(MedForm.values);
  static JsonTypeConverter2<ScheduleType, String, String>
  $converterscheduleType = const EnumNameConverter<ScheduleType>(
    ScheduleType.values,
  );
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String name;
  final String strength;
  final MedForm form;
  final String instructions;
  final ScheduleType scheduleType;

  /// Comma-separated minutes-since-midnight, e.g. "480,780,1200".
  /// Used by [ScheduleType.timesOfDay] and [ScheduleType.weekdays].
  final String doseTimes;
  final int? intervalHours;

  /// Bitmask Mon=1 … Sun=64. Used by [ScheduleType.weekdays].
  final int? weekdaysMask;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isSos;
  final int? maxPerDay;
  final int? minGapMinutes;
  final int? stockCount;
  final DateTime? archivedAt;
  final DateTime createdAt;
  const Medication({
    required this.id,
    required this.name,
    required this.strength,
    required this.form,
    required this.instructions,
    required this.scheduleType,
    required this.doseTimes,
    this.intervalHours,
    this.weekdaysMask,
    required this.startDate,
    this.endDate,
    required this.isSos,
    this.maxPerDay,
    this.minGapMinutes,
    this.stockCount,
    this.archivedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['strength'] = Variable<String>(strength);
    {
      map['form'] = Variable<String>(
        $MedicationsTable.$converterform.toSql(form),
      );
    }
    map['instructions'] = Variable<String>(instructions);
    {
      map['schedule_type'] = Variable<String>(
        $MedicationsTable.$converterscheduleType.toSql(scheduleType),
      );
    }
    map['dose_times'] = Variable<String>(doseTimes);
    if (!nullToAbsent || intervalHours != null) {
      map['interval_hours'] = Variable<int>(intervalHours);
    }
    if (!nullToAbsent || weekdaysMask != null) {
      map['weekdays_mask'] = Variable<int>(weekdaysMask);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['is_sos'] = Variable<bool>(isSos);
    if (!nullToAbsent || maxPerDay != null) {
      map['max_per_day'] = Variable<int>(maxPerDay);
    }
    if (!nullToAbsent || minGapMinutes != null) {
      map['min_gap_minutes'] = Variable<int>(minGapMinutes);
    }
    if (!nullToAbsent || stockCount != null) {
      map['stock_count'] = Variable<int>(stockCount);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      name: Value(name),
      strength: Value(strength),
      form: Value(form),
      instructions: Value(instructions),
      scheduleType: Value(scheduleType),
      doseTimes: Value(doseTimes),
      intervalHours: intervalHours == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalHours),
      weekdaysMask: weekdaysMask == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdaysMask),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isSos: Value(isSos),
      maxPerDay: maxPerDay == null && nullToAbsent
          ? const Value.absent()
          : Value(maxPerDay),
      minGapMinutes: minGapMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(minGapMinutes),
      stockCount: stockCount == null && nullToAbsent
          ? const Value.absent()
          : Value(stockCount),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: Value(createdAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      strength: serializer.fromJson<String>(json['strength']),
      form: $MedicationsTable.$converterform.fromJson(
        serializer.fromJson<String>(json['form']),
      ),
      instructions: serializer.fromJson<String>(json['instructions']),
      scheduleType: $MedicationsTable.$converterscheduleType.fromJson(
        serializer.fromJson<String>(json['scheduleType']),
      ),
      doseTimes: serializer.fromJson<String>(json['doseTimes']),
      intervalHours: serializer.fromJson<int?>(json['intervalHours']),
      weekdaysMask: serializer.fromJson<int?>(json['weekdaysMask']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      isSos: serializer.fromJson<bool>(json['isSos']),
      maxPerDay: serializer.fromJson<int?>(json['maxPerDay']),
      minGapMinutes: serializer.fromJson<int?>(json['minGapMinutes']),
      stockCount: serializer.fromJson<int?>(json['stockCount']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'strength': serializer.toJson<String>(strength),
      'form': serializer.toJson<String>(
        $MedicationsTable.$converterform.toJson(form),
      ),
      'instructions': serializer.toJson<String>(instructions),
      'scheduleType': serializer.toJson<String>(
        $MedicationsTable.$converterscheduleType.toJson(scheduleType),
      ),
      'doseTimes': serializer.toJson<String>(doseTimes),
      'intervalHours': serializer.toJson<int?>(intervalHours),
      'weekdaysMask': serializer.toJson<int?>(weekdaysMask),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'isSos': serializer.toJson<bool>(isSos),
      'maxPerDay': serializer.toJson<int?>(maxPerDay),
      'minGapMinutes': serializer.toJson<int?>(minGapMinutes),
      'stockCount': serializer.toJson<int?>(stockCount),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Medication copyWith({
    String? id,
    String? name,
    String? strength,
    MedForm? form,
    String? instructions,
    ScheduleType? scheduleType,
    String? doseTimes,
    Value<int?> intervalHours = const Value.absent(),
    Value<int?> weekdaysMask = const Value.absent(),
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    bool? isSos,
    Value<int?> maxPerDay = const Value.absent(),
    Value<int?> minGapMinutes = const Value.absent(),
    Value<int?> stockCount = const Value.absent(),
    Value<DateTime?> archivedAt = const Value.absent(),
    DateTime? createdAt,
  }) => Medication(
    id: id ?? this.id,
    name: name ?? this.name,
    strength: strength ?? this.strength,
    form: form ?? this.form,
    instructions: instructions ?? this.instructions,
    scheduleType: scheduleType ?? this.scheduleType,
    doseTimes: doseTimes ?? this.doseTimes,
    intervalHours: intervalHours.present
        ? intervalHours.value
        : this.intervalHours,
    weekdaysMask: weekdaysMask.present ? weekdaysMask.value : this.weekdaysMask,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    isSos: isSos ?? this.isSos,
    maxPerDay: maxPerDay.present ? maxPerDay.value : this.maxPerDay,
    minGapMinutes: minGapMinutes.present
        ? minGapMinutes.value
        : this.minGapMinutes,
    stockCount: stockCount.present ? stockCount.value : this.stockCount,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      strength: data.strength.present ? data.strength.value : this.strength,
      form: data.form.present ? data.form.value : this.form,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      scheduleType: data.scheduleType.present
          ? data.scheduleType.value
          : this.scheduleType,
      doseTimes: data.doseTimes.present ? data.doseTimes.value : this.doseTimes,
      intervalHours: data.intervalHours.present
          ? data.intervalHours.value
          : this.intervalHours,
      weekdaysMask: data.weekdaysMask.present
          ? data.weekdaysMask.value
          : this.weekdaysMask,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isSos: data.isSos.present ? data.isSos.value : this.isSos,
      maxPerDay: data.maxPerDay.present ? data.maxPerDay.value : this.maxPerDay,
      minGapMinutes: data.minGapMinutes.present
          ? data.minGapMinutes.value
          : this.minGapMinutes,
      stockCount: data.stockCount.present
          ? data.stockCount.value
          : this.stockCount,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('form: $form, ')
          ..write('instructions: $instructions, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('doseTimes: $doseTimes, ')
          ..write('intervalHours: $intervalHours, ')
          ..write('weekdaysMask: $weekdaysMask, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isSos: $isSos, ')
          ..write('maxPerDay: $maxPerDay, ')
          ..write('minGapMinutes: $minGapMinutes, ')
          ..write('stockCount: $stockCount, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    strength,
    form,
    instructions,
    scheduleType,
    doseTimes,
    intervalHours,
    weekdaysMask,
    startDate,
    endDate,
    isSos,
    maxPerDay,
    minGapMinutes,
    stockCount,
    archivedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.name == this.name &&
          other.strength == this.strength &&
          other.form == this.form &&
          other.instructions == this.instructions &&
          other.scheduleType == this.scheduleType &&
          other.doseTimes == this.doseTimes &&
          other.intervalHours == this.intervalHours &&
          other.weekdaysMask == this.weekdaysMask &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isSos == this.isSos &&
          other.maxPerDay == this.maxPerDay &&
          other.minGapMinutes == this.minGapMinutes &&
          other.stockCount == this.stockCount &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> strength;
  final Value<MedForm> form;
  final Value<String> instructions;
  final Value<ScheduleType> scheduleType;
  final Value<String> doseTimes;
  final Value<int?> intervalHours;
  final Value<int?> weekdaysMask;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> isSos;
  final Value<int?> maxPerDay;
  final Value<int?> minGapMinutes;
  final Value<int?> stockCount;
  final Value<DateTime?> archivedAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.strength = const Value.absent(),
    this.form = const Value.absent(),
    this.instructions = const Value.absent(),
    this.scheduleType = const Value.absent(),
    this.doseTimes = const Value.absent(),
    this.intervalHours = const Value.absent(),
    this.weekdaysMask = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isSos = const Value.absent(),
    this.maxPerDay = const Value.absent(),
    this.minGapMinutes = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.strength = const Value.absent(),
    required MedForm form,
    this.instructions = const Value.absent(),
    required ScheduleType scheduleType,
    this.doseTimes = const Value.absent(),
    this.intervalHours = const Value.absent(),
    this.weekdaysMask = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.isSos = const Value.absent(),
    this.maxPerDay = const Value.absent(),
    this.minGapMinutes = const Value.absent(),
    this.stockCount = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       form = Value(form),
       scheduleType = Value(scheduleType),
       startDate = Value(startDate);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? strength,
    Expression<String>? form,
    Expression<String>? instructions,
    Expression<String>? scheduleType,
    Expression<String>? doseTimes,
    Expression<int>? intervalHours,
    Expression<int>? weekdaysMask,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isSos,
    Expression<int>? maxPerDay,
    Expression<int>? minGapMinutes,
    Expression<int>? stockCount,
    Expression<DateTime>? archivedAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (strength != null) 'strength': strength,
      if (form != null) 'form': form,
      if (instructions != null) 'instructions': instructions,
      if (scheduleType != null) 'schedule_type': scheduleType,
      if (doseTimes != null) 'dose_times': doseTimes,
      if (intervalHours != null) 'interval_hours': intervalHours,
      if (weekdaysMask != null) 'weekdays_mask': weekdaysMask,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isSos != null) 'is_sos': isSos,
      if (maxPerDay != null) 'max_per_day': maxPerDay,
      if (minGapMinutes != null) 'min_gap_minutes': minGapMinutes,
      if (stockCount != null) 'stock_count': stockCount,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? strength,
    Value<MedForm>? form,
    Value<String>? instructions,
    Value<ScheduleType>? scheduleType,
    Value<String>? doseTimes,
    Value<int?>? intervalHours,
    Value<int?>? weekdaysMask,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<bool>? isSos,
    Value<int?>? maxPerDay,
    Value<int?>? minGapMinutes,
    Value<int?>? stockCount,
    Value<DateTime?>? archivedAt,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      strength: strength ?? this.strength,
      form: form ?? this.form,
      instructions: instructions ?? this.instructions,
      scheduleType: scheduleType ?? this.scheduleType,
      doseTimes: doseTimes ?? this.doseTimes,
      intervalHours: intervalHours ?? this.intervalHours,
      weekdaysMask: weekdaysMask ?? this.weekdaysMask,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isSos: isSos ?? this.isSos,
      maxPerDay: maxPerDay ?? this.maxPerDay,
      minGapMinutes: minGapMinutes ?? this.minGapMinutes,
      stockCount: stockCount ?? this.stockCount,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(
        $MedicationsTable.$converterform.toSql(form.value),
      );
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (scheduleType.present) {
      map['schedule_type'] = Variable<String>(
        $MedicationsTable.$converterscheduleType.toSql(scheduleType.value),
      );
    }
    if (doseTimes.present) {
      map['dose_times'] = Variable<String>(doseTimes.value);
    }
    if (intervalHours.present) {
      map['interval_hours'] = Variable<int>(intervalHours.value);
    }
    if (weekdaysMask.present) {
      map['weekdays_mask'] = Variable<int>(weekdaysMask.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isSos.present) {
      map['is_sos'] = Variable<bool>(isSos.value);
    }
    if (maxPerDay.present) {
      map['max_per_day'] = Variable<int>(maxPerDay.value);
    }
    if (minGapMinutes.present) {
      map['min_gap_minutes'] = Variable<int>(minGapMinutes.value);
    }
    if (stockCount.present) {
      map['stock_count'] = Variable<int>(stockCount.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('form: $form, ')
          ..write('instructions: $instructions, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('doseTimes: $doseTimes, ')
          ..write('intervalHours: $intervalHours, ')
          ..write('weekdaysMask: $weekdaysMask, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isSos: $isSos, ')
          ..write('maxPerDay: $maxPerDay, ')
          ..write('minGapMinutes: $minGapMinutes, ')
          ..write('stockCount: $stockCount, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseInstancesTable extends DoseInstances
    with TableInfo<$DoseInstancesTable, DoseInstance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseInstancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _uuid.v4,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DoseStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(DoseStatus.upcoming.name),
      ).withConverter<DoseStatus>($DoseInstancesTable.$converterstatus);
  static const VerificationMeta _actionAtMeta = const VerificationMeta(
    'actionAt',
  );
  @override
  late final GeneratedColumn<DateTime> actionAt = GeneratedColumn<DateTime>(
    'action_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> snoozedUntil = GeneratedColumn<DateTime>(
    'snoozed_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    scheduledAt,
    status,
    actionAt,
    snoozedUntil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_instances';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoseInstance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('action_at')) {
      context.handle(
        _actionAtMeta,
        actionAt.isAcceptableOrUnknown(data['action_at']!, _actionAtMeta),
      );
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {medicationId, scheduledAt},
  ];
  @override
  DoseInstance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseInstance(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      status: $DoseInstancesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      actionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}action_at'],
      ),
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snoozed_until'],
      ),
    );
  }

  @override
  $DoseInstancesTable createAlias(String alias) {
    return $DoseInstancesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DoseStatus, String, String> $converterstatus =
      const EnumNameConverter<DoseStatus>(DoseStatus.values);
}

class DoseInstance extends DataClass implements Insertable<DoseInstance> {
  final String id;
  final String medicationId;
  final DateTime scheduledAt;
  final DoseStatus status;
  final DateTime? actionAt;
  final DateTime? snoozedUntil;
  const DoseInstance({
    required this.id,
    required this.medicationId,
    required this.scheduledAt,
    required this.status,
    this.actionAt,
    this.snoozedUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    {
      map['status'] = Variable<String>(
        $DoseInstancesTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || actionAt != null) {
      map['action_at'] = Variable<DateTime>(actionAt);
    }
    if (!nullToAbsent || snoozedUntil != null) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil);
    }
    return map;
  }

  DoseInstancesCompanion toCompanion(bool nullToAbsent) {
    return DoseInstancesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      scheduledAt: Value(scheduledAt),
      status: Value(status),
      actionAt: actionAt == null && nullToAbsent
          ? const Value.absent()
          : Value(actionAt),
      snoozedUntil: snoozedUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(snoozedUntil),
    );
  }

  factory DoseInstance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseInstance(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      status: $DoseInstancesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      actionAt: serializer.fromJson<DateTime?>(json['actionAt']),
      snoozedUntil: serializer.fromJson<DateTime?>(json['snoozedUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicationId': serializer.toJson<String>(medicationId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'status': serializer.toJson<String>(
        $DoseInstancesTable.$converterstatus.toJson(status),
      ),
      'actionAt': serializer.toJson<DateTime?>(actionAt),
      'snoozedUntil': serializer.toJson<DateTime?>(snoozedUntil),
    };
  }

  DoseInstance copyWith({
    String? id,
    String? medicationId,
    DateTime? scheduledAt,
    DoseStatus? status,
    Value<DateTime?> actionAt = const Value.absent(),
    Value<DateTime?> snoozedUntil = const Value.absent(),
  }) => DoseInstance(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    status: status ?? this.status,
    actionAt: actionAt.present ? actionAt.value : this.actionAt,
    snoozedUntil: snoozedUntil.present ? snoozedUntil.value : this.snoozedUntil,
  );
  DoseInstance copyWithCompanion(DoseInstancesCompanion data) {
    return DoseInstance(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      status: data.status.present ? data.status.value : this.status,
      actionAt: data.actionAt.present ? data.actionAt.value : this.actionAt,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseInstance(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('actionAt: $actionAt, ')
          ..write('snoozedUntil: $snoozedUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    medicationId,
    scheduledAt,
    status,
    actionAt,
    snoozedUntil,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseInstance &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.scheduledAt == this.scheduledAt &&
          other.status == this.status &&
          other.actionAt == this.actionAt &&
          other.snoozedUntil == this.snoozedUntil);
}

class DoseInstancesCompanion extends UpdateCompanion<DoseInstance> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<DateTime> scheduledAt;
  final Value<DoseStatus> status;
  final Value<DateTime?> actionAt;
  final Value<DateTime?> snoozedUntil;
  final Value<int> rowid;
  const DoseInstancesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.status = const Value.absent(),
    this.actionAt = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseInstancesCompanion.insert({
    this.id = const Value.absent(),
    required String medicationId,
    required DateTime scheduledAt,
    this.status = const Value.absent(),
    this.actionAt = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : medicationId = Value(medicationId),
       scheduledAt = Value(scheduledAt);
  static Insertable<DoseInstance> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<DateTime>? scheduledAt,
    Expression<String>? status,
    Expression<DateTime>? actionAt,
    Expression<DateTime>? snoozedUntil,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (status != null) 'status': status,
      if (actionAt != null) 'action_at': actionAt,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseInstancesCompanion copyWith({
    Value<String>? id,
    Value<String>? medicationId,
    Value<DateTime>? scheduledAt,
    Value<DoseStatus>? status,
    Value<DateTime?>? actionAt,
    Value<DateTime?>? snoozedUntil,
    Value<int>? rowid,
  }) {
    return DoseInstancesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      actionAt: actionAt ?? this.actionAt,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $DoseInstancesTable.$converterstatus.toSql(status.value),
      );
    }
    if (actionAt.present) {
      map['action_at'] = Variable<DateTime>(actionAt.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseInstancesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('actionAt: $actionAt, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationLogEntriesTable extends MedicationLogEntries
    with TableInfo<$MedicationLogEntriesTable, MedicationLogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationLogEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _uuid.v4,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseInstanceIdMeta = const VerificationMeta(
    'doseInstanceId',
  );
  @override
  late final GeneratedColumn<String> doseInstanceId = GeneratedColumn<String>(
    'dose_instance_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actualAtMeta = const VerificationMeta(
    'actualAt',
  );
  @override
  late final GeneratedColumn<DateTime> actualAt = GeneratedColumn<DateTime>(
    'actual_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LogStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LogStatus>($MedicationLogEntriesTable.$converterstatus);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    medicationName,
    doseInstanceId,
    scheduledAt,
    actualAt,
    status,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_log_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationLogEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('dose_instance_id')) {
      context.handle(
        _doseInstanceIdMeta,
        doseInstanceId.isAcceptableOrUnknown(
          data['dose_instance_id']!,
          _doseInstanceIdMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    }
    if (data.containsKey('actual_at')) {
      context.handle(
        _actualAtMeta,
        actualAt.isAcceptableOrUnknown(data['actual_at']!, _actualAtMeta),
      );
    } else if (isInserting) {
      context.missing(_actualAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationLogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationLogEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      )!,
      doseInstanceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_instance_id'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      ),
      actualAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_at'],
      )!,
      status: $MedicationLogEntriesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
    );
  }

  @override
  $MedicationLogEntriesTable createAlias(String alias) {
    return $MedicationLogEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogStatus, String, String> $converterstatus =
      const EnumNameConverter<LogStatus>(LogStatus.values);
}

class MedicationLogEntry extends DataClass
    implements Insertable<MedicationLogEntry> {
  final String id;
  final String medicationId;
  final String medicationName;
  final String? doseInstanceId;
  final DateTime? scheduledAt;
  final DateTime actualAt;
  final LogStatus status;
  final String note;
  const MedicationLogEntry({
    required this.id,
    required this.medicationId,
    required this.medicationName,
    this.doseInstanceId,
    this.scheduledAt,
    required this.actualAt,
    required this.status,
    required this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['medication_name'] = Variable<String>(medicationName);
    if (!nullToAbsent || doseInstanceId != null) {
      map['dose_instance_id'] = Variable<String>(doseInstanceId);
    }
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    }
    map['actual_at'] = Variable<DateTime>(actualAt);
    {
      map['status'] = Variable<String>(
        $MedicationLogEntriesTable.$converterstatus.toSql(status),
      );
    }
    map['note'] = Variable<String>(note);
    return map;
  }

  MedicationLogEntriesCompanion toCompanion(bool nullToAbsent) {
    return MedicationLogEntriesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      medicationName: Value(medicationName),
      doseInstanceId: doseInstanceId == null && nullToAbsent
          ? const Value.absent()
          : Value(doseInstanceId),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      actualAt: Value(actualAt),
      status: Value(status),
      note: Value(note),
    );
  }

  factory MedicationLogEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationLogEntry(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      doseInstanceId: serializer.fromJson<String?>(json['doseInstanceId']),
      scheduledAt: serializer.fromJson<DateTime?>(json['scheduledAt']),
      actualAt: serializer.fromJson<DateTime>(json['actualAt']),
      status: $MedicationLogEntriesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicationId': serializer.toJson<String>(medicationId),
      'medicationName': serializer.toJson<String>(medicationName),
      'doseInstanceId': serializer.toJson<String?>(doseInstanceId),
      'scheduledAt': serializer.toJson<DateTime?>(scheduledAt),
      'actualAt': serializer.toJson<DateTime>(actualAt),
      'status': serializer.toJson<String>(
        $MedicationLogEntriesTable.$converterstatus.toJson(status),
      ),
      'note': serializer.toJson<String>(note),
    };
  }

  MedicationLogEntry copyWith({
    String? id,
    String? medicationId,
    String? medicationName,
    Value<String?> doseInstanceId = const Value.absent(),
    Value<DateTime?> scheduledAt = const Value.absent(),
    DateTime? actualAt,
    LogStatus? status,
    String? note,
  }) => MedicationLogEntry(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    medicationName: medicationName ?? this.medicationName,
    doseInstanceId: doseInstanceId.present
        ? doseInstanceId.value
        : this.doseInstanceId,
    scheduledAt: scheduledAt.present ? scheduledAt.value : this.scheduledAt,
    actualAt: actualAt ?? this.actualAt,
    status: status ?? this.status,
    note: note ?? this.note,
  );
  MedicationLogEntry copyWithCompanion(MedicationLogEntriesCompanion data) {
    return MedicationLogEntry(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      doseInstanceId: data.doseInstanceId.present
          ? data.doseInstanceId.value
          : this.doseInstanceId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      actualAt: data.actualAt.present ? data.actualAt.value : this.actualAt,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLogEntry(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('medicationName: $medicationName, ')
          ..write('doseInstanceId: $doseInstanceId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('actualAt: $actualAt, ')
          ..write('status: $status, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    medicationId,
    medicationName,
    doseInstanceId,
    scheduledAt,
    actualAt,
    status,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationLogEntry &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.medicationName == this.medicationName &&
          other.doseInstanceId == this.doseInstanceId &&
          other.scheduledAt == this.scheduledAt &&
          other.actualAt == this.actualAt &&
          other.status == this.status &&
          other.note == this.note);
}

class MedicationLogEntriesCompanion
    extends UpdateCompanion<MedicationLogEntry> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<String> medicationName;
  final Value<String?> doseInstanceId;
  final Value<DateTime?> scheduledAt;
  final Value<DateTime> actualAt;
  final Value<LogStatus> status;
  final Value<String> note;
  final Value<int> rowid;
  const MedicationLogEntriesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.doseInstanceId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.actualAt = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationLogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String medicationId,
    required String medicationName,
    this.doseInstanceId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    required DateTime actualAt,
    required LogStatus status,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : medicationId = Value(medicationId),
       medicationName = Value(medicationName),
       actualAt = Value(actualAt),
       status = Value(status);
  static Insertable<MedicationLogEntry> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<String>? medicationName,
    Expression<String>? doseInstanceId,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? actualAt,
    Expression<String>? status,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (medicationName != null) 'medication_name': medicationName,
      if (doseInstanceId != null) 'dose_instance_id': doseInstanceId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (actualAt != null) 'actual_at': actualAt,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationLogEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? medicationId,
    Value<String>? medicationName,
    Value<String?>? doseInstanceId,
    Value<DateTime?>? scheduledAt,
    Value<DateTime>? actualAt,
    Value<LogStatus>? status,
    Value<String>? note,
    Value<int>? rowid,
  }) {
    return MedicationLogEntriesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      medicationName: medicationName ?? this.medicationName,
      doseInstanceId: doseInstanceId ?? this.doseInstanceId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      actualAt: actualAt ?? this.actualAt,
      status: status ?? this.status,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (doseInstanceId.present) {
      map['dose_instance_id'] = Variable<String>(doseInstanceId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (actualAt.present) {
      map['actual_at'] = Variable<DateTime>(actualAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $MedicationLogEntriesTable.$converterstatus.toSql(status.value),
      );
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('medicationName: $medicationName, ')
          ..write('doseInstanceId: $doseInstanceId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('actualAt: $actualAt, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $DoseInstancesTable doseInstances = $DoseInstancesTable(this);
  late final $MedicationLogEntriesTable medicationLogEntries =
      $MedicationLogEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    medications,
    doseInstances,
    medicationLogEntries,
  ];
}

typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      required String name,
      Value<String> strength,
      required MedForm form,
      Value<String> instructions,
      required ScheduleType scheduleType,
      Value<String> doseTimes,
      Value<int?> intervalHours,
      Value<int?> weekdaysMask,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<bool> isSos,
      Value<int?> maxPerDay,
      Value<int?> minGapMinutes,
      Value<int?> stockCount,
      Value<DateTime?> archivedAt,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> strength,
      Value<MedForm> form,
      Value<String> instructions,
      Value<ScheduleType> scheduleType,
      Value<String> doseTimes,
      Value<int?> intervalHours,
      Value<int?> weekdaysMask,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<bool> isSos,
      Value<int?> maxPerDay,
      Value<int?> minGapMinutes,
      Value<int?> stockCount,
      Value<DateTime?> archivedAt,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDb, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DoseInstancesTable, List<DoseInstance>>
  _doseInstancesRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.doseInstances,
    aliasName: 'medications__id__dose_instances__medication_id',
  );

  $$DoseInstancesTableProcessedTableManager get doseInstancesRefs {
    final manager = $$DoseInstancesTableTableManager(
      $_db,
      $_db.doseInstances,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_doseInstancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDb, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MedForm, MedForm, String> get form =>
      $composableBuilder(
        column: $table.form,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ScheduleType, ScheduleType, String>
  get scheduleType => $composableBuilder(
    column: $table.scheduleType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get doseTimes => $composableBuilder(
    column: $table.doseTimes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalHours => $composableBuilder(
    column: $table.intervalHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSos => $composableBuilder(
    column: $table.isSos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxPerDay => $composableBuilder(
    column: $table.maxPerDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minGapMinutes => $composableBuilder(
    column: $table.minGapMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> doseInstancesRefs(
    Expression<bool> Function($$DoseInstancesTableFilterComposer f) f,
  ) {
    final $$DoseInstancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseInstances,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseInstancesTableFilterComposer(
            $db: $db,
            $table: $db.doseInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDb, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduleType => $composableBuilder(
    column: $table.scheduleType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseTimes => $composableBuilder(
    column: $table.doseTimes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalHours => $composableBuilder(
    column: $table.intervalHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSos => $composableBuilder(
    column: $table.isSos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxPerDay => $composableBuilder(
    column: $table.maxPerDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minGapMinutes => $composableBuilder(
    column: $table.minGapMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDb, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MedForm, String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ScheduleType, String> get scheduleType =>
      $composableBuilder(
        column: $table.scheduleType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get doseTimes =>
      $composableBuilder(column: $table.doseTimes, builder: (column) => column);

  GeneratedColumn<int> get intervalHours => $composableBuilder(
    column: $table.intervalHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weekdaysMask => $composableBuilder(
    column: $table.weekdaysMask,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isSos =>
      $composableBuilder(column: $table.isSos, builder: (column) => column);

  GeneratedColumn<int> get maxPerDay =>
      $composableBuilder(column: $table.maxPerDay, builder: (column) => column);

  GeneratedColumn<int> get minGapMinutes => $composableBuilder(
    column: $table.minGapMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stockCount => $composableBuilder(
    column: $table.stockCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> doseInstancesRefs<T extends Object>(
    Expression<T> Function($$DoseInstancesTableAnnotationComposer a) f,
  ) {
    final $$DoseInstancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseInstances,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseInstancesTableAnnotationComposer(
            $db: $db,
            $table: $db.doseInstances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({bool doseInstancesRefs})
        > {
  $$MedicationsTableTableManager(_$AppDb db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> strength = const Value.absent(),
                Value<MedForm> form = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<ScheduleType> scheduleType = const Value.absent(),
                Value<String> doseTimes = const Value.absent(),
                Value<int?> intervalHours = const Value.absent(),
                Value<int?> weekdaysMask = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> isSos = const Value.absent(),
                Value<int?> maxPerDay = const Value.absent(),
                Value<int?> minGapMinutes = const Value.absent(),
                Value<int?> stockCount = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                name: name,
                strength: strength,
                form: form,
                instructions: instructions,
                scheduleType: scheduleType,
                doseTimes: doseTimes,
                intervalHours: intervalHours,
                weekdaysMask: weekdaysMask,
                startDate: startDate,
                endDate: endDate,
                isSos: isSos,
                maxPerDay: maxPerDay,
                minGapMinutes: minGapMinutes,
                stockCount: stockCount,
                archivedAt: archivedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String> strength = const Value.absent(),
                required MedForm form,
                Value<String> instructions = const Value.absent(),
                required ScheduleType scheduleType,
                Value<String> doseTimes = const Value.absent(),
                Value<int?> intervalHours = const Value.absent(),
                Value<int?> weekdaysMask = const Value.absent(),
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> isSos = const Value.absent(),
                Value<int?> maxPerDay = const Value.absent(),
                Value<int?> minGapMinutes = const Value.absent(),
                Value<int?> stockCount = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                name: name,
                strength: strength,
                form: form,
                instructions: instructions,
                scheduleType: scheduleType,
                doseTimes: doseTimes,
                intervalHours: intervalHours,
                weekdaysMask: weekdaysMask,
                startDate: startDate,
                endDate: endDate,
                isSos: isSos,
                maxPerDay: maxPerDay,
                minGapMinutes: minGapMinutes,
                stockCount: stockCount,
                archivedAt: archivedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({doseInstancesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (doseInstancesRefs) db.doseInstances,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (doseInstancesRefs)
                    await $_getPrefetchedData<
                      Medication,
                      $MedicationsTable,
                      DoseInstance
                    >(
                      currentTable: table,
                      referencedTable: $$MedicationsTableReferences
                          ._doseInstancesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MedicationsTableReferences(
                            db,
                            table,
                            p0,
                          ).doseInstancesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.medicationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({bool doseInstancesRefs})
    >;
typedef $$DoseInstancesTableCreateCompanionBuilder =
    DoseInstancesCompanion Function({
      Value<String> id,
      required String medicationId,
      required DateTime scheduledAt,
      Value<DoseStatus> status,
      Value<DateTime?> actionAt,
      Value<DateTime?> snoozedUntil,
      Value<int> rowid,
    });
typedef $$DoseInstancesTableUpdateCompanionBuilder =
    DoseInstancesCompanion Function({
      Value<String> id,
      Value<String> medicationId,
      Value<DateTime> scheduledAt,
      Value<DoseStatus> status,
      Value<DateTime?> actionAt,
      Value<DateTime?> snoozedUntil,
      Value<int> rowid,
    });

final class $$DoseInstancesTableReferences
    extends BaseReferences<_$AppDb, $DoseInstancesTable, DoseInstance> {
  $$DoseInstancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicationsTable _medicationIdTable(_$AppDb db) => db.medications
      .createAlias('dose_instances__medication_id__medications__id');

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoseInstancesTableFilterComposer
    extends Composer<_$AppDb, $DoseInstancesTable> {
  $$DoseInstancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DoseStatus, DoseStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get actionAt => $composableBuilder(
    column: $table.actionAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseInstancesTableOrderingComposer
    extends Composer<_$AppDb, $DoseInstancesTable> {
  $$DoseInstancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actionAt => $composableBuilder(
    column: $table.actionAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseInstancesTableAnnotationComposer
    extends Composer<_$AppDb, $DoseInstancesTable> {
  $$DoseInstancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DoseStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get actionAt =>
      $composableBuilder(column: $table.actionAt, builder: (column) => column);

  GeneratedColumn<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseInstancesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $DoseInstancesTable,
          DoseInstance,
          $$DoseInstancesTableFilterComposer,
          $$DoseInstancesTableOrderingComposer,
          $$DoseInstancesTableAnnotationComposer,
          $$DoseInstancesTableCreateCompanionBuilder,
          $$DoseInstancesTableUpdateCompanionBuilder,
          (DoseInstance, $$DoseInstancesTableReferences),
          DoseInstance,
          PrefetchHooks Function({bool medicationId})
        > {
  $$DoseInstancesTableTableManager(_$AppDb db, $DoseInstancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseInstancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseInstancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseInstancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<DoseStatus> status = const Value.absent(),
                Value<DateTime?> actionAt = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseInstancesCompanion(
                id: id,
                medicationId: medicationId,
                scheduledAt: scheduledAt,
                status: status,
                actionAt: actionAt,
                snoozedUntil: snoozedUntil,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String medicationId,
                required DateTime scheduledAt,
                Value<DoseStatus> status = const Value.absent(),
                Value<DateTime?> actionAt = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseInstancesCompanion.insert(
                id: id,
                medicationId: medicationId,
                scheduledAt: scheduledAt,
                status: status,
                actionAt: actionAt,
                snoozedUntil: snoozedUntil,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DoseInstancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$DoseInstancesTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$DoseInstancesTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoseInstancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $DoseInstancesTable,
      DoseInstance,
      $$DoseInstancesTableFilterComposer,
      $$DoseInstancesTableOrderingComposer,
      $$DoseInstancesTableAnnotationComposer,
      $$DoseInstancesTableCreateCompanionBuilder,
      $$DoseInstancesTableUpdateCompanionBuilder,
      (DoseInstance, $$DoseInstancesTableReferences),
      DoseInstance,
      PrefetchHooks Function({bool medicationId})
    >;
typedef $$MedicationLogEntriesTableCreateCompanionBuilder =
    MedicationLogEntriesCompanion Function({
      Value<String> id,
      required String medicationId,
      required String medicationName,
      Value<String?> doseInstanceId,
      Value<DateTime?> scheduledAt,
      required DateTime actualAt,
      required LogStatus status,
      Value<String> note,
      Value<int> rowid,
    });
typedef $$MedicationLogEntriesTableUpdateCompanionBuilder =
    MedicationLogEntriesCompanion Function({
      Value<String> id,
      Value<String> medicationId,
      Value<String> medicationName,
      Value<String?> doseInstanceId,
      Value<DateTime?> scheduledAt,
      Value<DateTime> actualAt,
      Value<LogStatus> status,
      Value<String> note,
      Value<int> rowid,
    });

class $$MedicationLogEntriesTableFilterComposer
    extends Composer<_$AppDb, $MedicationLogEntriesTable> {
  $$MedicationLogEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationId => $composableBuilder(
    column: $table.medicationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseInstanceId => $composableBuilder(
    column: $table.doseInstanceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualAt => $composableBuilder(
    column: $table.actualAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LogStatus, LogStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicationLogEntriesTableOrderingComposer
    extends Composer<_$AppDb, $MedicationLogEntriesTable> {
  $$MedicationLogEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationId => $composableBuilder(
    column: $table.medicationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseInstanceId => $composableBuilder(
    column: $table.doseInstanceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualAt => $composableBuilder(
    column: $table.actualAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationLogEntriesTableAnnotationComposer
    extends Composer<_$AppDb, $MedicationLogEntriesTable> {
  $$MedicationLogEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicationId => $composableBuilder(
    column: $table.medicationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doseInstanceId => $composableBuilder(
    column: $table.doseInstanceId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualAt =>
      $composableBuilder(column: $table.actualAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$MedicationLogEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $MedicationLogEntriesTable,
          MedicationLogEntry,
          $$MedicationLogEntriesTableFilterComposer,
          $$MedicationLogEntriesTableOrderingComposer,
          $$MedicationLogEntriesTableAnnotationComposer,
          $$MedicationLogEntriesTableCreateCompanionBuilder,
          $$MedicationLogEntriesTableUpdateCompanionBuilder,
          (
            MedicationLogEntry,
            BaseReferences<
              _$AppDb,
              $MedicationLogEntriesTable,
              MedicationLogEntry
            >,
          ),
          MedicationLogEntry,
          PrefetchHooks Function()
        > {
  $$MedicationLogEntriesTableTableManager(
    _$AppDb db,
    $MedicationLogEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationLogEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationLogEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MedicationLogEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<String?> doseInstanceId = const Value.absent(),
                Value<DateTime?> scheduledAt = const Value.absent(),
                Value<DateTime> actualAt = const Value.absent(),
                Value<LogStatus> status = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationLogEntriesCompanion(
                id: id,
                medicationId: medicationId,
                medicationName: medicationName,
                doseInstanceId: doseInstanceId,
                scheduledAt: scheduledAt,
                actualAt: actualAt,
                status: status,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String medicationId,
                required String medicationName,
                Value<String?> doseInstanceId = const Value.absent(),
                Value<DateTime?> scheduledAt = const Value.absent(),
                required DateTime actualAt,
                required LogStatus status,
                Value<String> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationLogEntriesCompanion.insert(
                id: id,
                medicationId: medicationId,
                medicationName: medicationName,
                doseInstanceId: doseInstanceId,
                scheduledAt: scheduledAt,
                actualAt: actualAt,
                status: status,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicationLogEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $MedicationLogEntriesTable,
      MedicationLogEntry,
      $$MedicationLogEntriesTableFilterComposer,
      $$MedicationLogEntriesTableOrderingComposer,
      $$MedicationLogEntriesTableAnnotationComposer,
      $$MedicationLogEntriesTableCreateCompanionBuilder,
      $$MedicationLogEntriesTableUpdateCompanionBuilder,
      (
        MedicationLogEntry,
        BaseReferences<_$AppDb, $MedicationLogEntriesTable, MedicationLogEntry>,
      ),
      MedicationLogEntry,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$DoseInstancesTableTableManager get doseInstances =>
      $$DoseInstancesTableTableManager(_db, _db.doseInstances);
  $$MedicationLogEntriesTableTableManager get medicationLogEntries =>
      $$MedicationLogEntriesTableTableManager(_db, _db.medicationLogEntries);
}
