// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitsSchemaStruct extends BaseStruct {
  UnitsSchemaStruct({
    int? id,
    String? name,
    bool? numeric,
  })  : _id = id,
        _name = name,
        _numeric = numeric;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "numeric" field.
  bool? _numeric;
  bool get numeric => _numeric ?? false;
  set numeric(bool? val) => _numeric = val;

  bool hasNumeric() => _numeric != null;

  static UnitsSchemaStruct fromMap(Map<String, dynamic> data) =>
      UnitsSchemaStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        numeric: data['numeric'] as bool?,
      );

  static UnitsSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? UnitsSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'numeric': _numeric,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'numeric': serializeParam(
          _numeric,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UnitsSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitsSchemaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        numeric: deserializeParam(
          data['numeric'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UnitsSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitsSchemaStruct &&
        id == other.id &&
        name == other.name &&
        numeric == other.numeric;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, numeric]);
}

UnitsSchemaStruct createUnitsSchemaStruct({
  int? id,
  String? name,
  bool? numeric,
}) =>
    UnitsSchemaStruct(
      id: id,
      name: name,
      numeric: numeric,
    );
