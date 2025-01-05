// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZutatenSchemaStruct extends BaseStruct {
  ZutatenSchemaStruct({
    int? category,
    int? id,
    String? name,
    double? co2eqPerUnit,
    int? unitType,
  })  : _category = category,
        _id = id,
        _name = name,
        _co2eqPerUnit = co2eqPerUnit,
        _unitType = unitType;

  // "category" field.
  int? _category;
  int get category => _category ?? 0;
  set category(int? val) => _category = val;

  void incrementCategory(int amount) => category = category + amount;

  bool hasCategory() => _category != null;

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

  // "co2eqPerUnit" field.
  double? _co2eqPerUnit;
  double get co2eqPerUnit => _co2eqPerUnit ?? 0.0;
  set co2eqPerUnit(double? val) => _co2eqPerUnit = val;

  void incrementCo2eqPerUnit(double amount) =>
      co2eqPerUnit = co2eqPerUnit + amount;

  bool hasCo2eqPerUnit() => _co2eqPerUnit != null;

  // "unitType" field.
  int? _unitType;
  int get unitType => _unitType ?? 0;
  set unitType(int? val) => _unitType = val;

  void incrementUnitType(int amount) => unitType = unitType + amount;

  bool hasUnitType() => _unitType != null;

  static ZutatenSchemaStruct fromMap(Map<String, dynamic> data) =>
      ZutatenSchemaStruct(
        category: castToType<int>(data['category']),
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        co2eqPerUnit: castToType<double>(data['co2eqPerUnit']),
        unitType: castToType<int>(data['unitType']),
      );

  static ZutatenSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? ZutatenSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'id': _id,
        'name': _name,
        'co2eqPerUnit': _co2eqPerUnit,
        'unitType': _unitType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'co2eqPerUnit': serializeParam(
          _co2eqPerUnit,
          ParamType.double,
        ),
        'unitType': serializeParam(
          _unitType,
          ParamType.int,
        ),
      }.withoutNulls;

  static ZutatenSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      ZutatenSchemaStruct(
        category: deserializeParam(
          data['category'],
          ParamType.int,
          false,
        ),
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
        co2eqPerUnit: deserializeParam(
          data['co2eqPerUnit'],
          ParamType.double,
          false,
        ),
        unitType: deserializeParam(
          data['unitType'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ZutatenSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ZutatenSchemaStruct &&
        category == other.category &&
        id == other.id &&
        name == other.name &&
        co2eqPerUnit == other.co2eqPerUnit &&
        unitType == other.unitType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([category, id, name, co2eqPerUnit, unitType]);
}

ZutatenSchemaStruct createZutatenSchemaStruct({
  int? category,
  int? id,
  String? name,
  double? co2eqPerUnit,
  int? unitType,
}) =>
    ZutatenSchemaStruct(
      category: category,
      id: id,
      name: name,
      co2eqPerUnit: co2eqPerUnit,
      unitType: unitType,
    );
