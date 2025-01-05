// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmissionsSchemaStruct extends BaseStruct {
  EmissionsSchemaStruct({
    double? annual,
    double? weekly,
    double? daily,
  })  : _annual = annual,
        _weekly = weekly,
        _daily = daily;

  // "Annual" field.
  double? _annual;
  double get annual => _annual ?? 4152.0;
  set annual(double? val) => _annual = val;

  void incrementAnnual(double amount) => annual = annual + amount;

  bool hasAnnual() => _annual != null;

  // "Weekly" field.
  double? _weekly;
  double get weekly => _weekly ?? 79.62;
  set weekly(double? val) => _weekly = val;

  void incrementWeekly(double amount) => weekly = weekly + amount;

  bool hasWeekly() => _weekly != null;

  // "Daily" field.
  double? _daily;
  double get daily => _daily ?? 11.37;
  set daily(double? val) => _daily = val;

  void incrementDaily(double amount) => daily = daily + amount;

  bool hasDaily() => _daily != null;

  static EmissionsSchemaStruct fromMap(Map<String, dynamic> data) =>
      EmissionsSchemaStruct(
        annual: castToType<double>(data['Annual']),
        weekly: castToType<double>(data['Weekly']),
        daily: castToType<double>(data['Daily']),
      );

  static EmissionsSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? EmissionsSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Annual': _annual,
        'Weekly': _weekly,
        'Daily': _daily,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Annual': serializeParam(
          _annual,
          ParamType.double,
        ),
        'Weekly': serializeParam(
          _weekly,
          ParamType.double,
        ),
        'Daily': serializeParam(
          _daily,
          ParamType.double,
        ),
      }.withoutNulls;

  static EmissionsSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmissionsSchemaStruct(
        annual: deserializeParam(
          data['Annual'],
          ParamType.double,
          false,
        ),
        weekly: deserializeParam(
          data['Weekly'],
          ParamType.double,
          false,
        ),
        daily: deserializeParam(
          data['Daily'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'EmissionsSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmissionsSchemaStruct &&
        annual == other.annual &&
        weekly == other.weekly &&
        daily == other.daily;
  }

  @override
  int get hashCode => const ListEquality().hash([annual, weekly, daily]);
}

EmissionsSchemaStruct createEmissionsSchemaStruct({
  double? annual,
  double? weekly,
  double? daily,
}) =>
    EmissionsSchemaStruct(
      annual: annual,
      weekly: weekly,
      daily: daily,
    );
