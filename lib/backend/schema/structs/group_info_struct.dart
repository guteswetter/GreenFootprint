// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupInfoStruct extends BaseStruct {
  GroupInfoStruct({
    String? name,
    String? periodStart,
    String? periodEnd,
  })  : _name = name,
        _periodStart = periodStart,
        _periodEnd = periodEnd;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "periodStart" field.
  String? _periodStart;
  String get periodStart => _periodStart ?? '';
  set periodStart(String? val) => _periodStart = val;

  bool hasPeriodStart() => _periodStart != null;

  // "periodEnd" field.
  String? _periodEnd;
  String get periodEnd => _periodEnd ?? '';
  set periodEnd(String? val) => _periodEnd = val;

  bool hasPeriodEnd() => _periodEnd != null;

  static GroupInfoStruct fromMap(Map<String, dynamic> data) => GroupInfoStruct(
        name: data['name'] as String?,
        periodStart: data['periodStart'] as String?,
        periodEnd: data['periodEnd'] as String?,
      );

  static GroupInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? GroupInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'periodStart': _periodStart,
        'periodEnd': _periodEnd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'periodStart': serializeParam(
          _periodStart,
          ParamType.String,
        ),
        'periodEnd': serializeParam(
          _periodEnd,
          ParamType.String,
        ),
      }.withoutNulls;

  static GroupInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GroupInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        periodStart: deserializeParam(
          data['periodStart'],
          ParamType.String,
          false,
        ),
        periodEnd: deserializeParam(
          data['periodEnd'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GroupInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GroupInfoStruct &&
        name == other.name &&
        periodStart == other.periodStart &&
        periodEnd == other.periodEnd;
  }

  @override
  int get hashCode => const ListEquality().hash([name, periodStart, periodEnd]);
}

GroupInfoStruct createGroupInfoStruct({
  String? name,
  String? periodStart,
  String? periodEnd,
}) =>
    GroupInfoStruct(
      name: name,
      periodStart: periodStart,
      periodEnd: periodEnd,
    );
