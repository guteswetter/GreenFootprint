// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LifestyleEmissionsSchemaStruct extends BaseStruct {
  LifestyleEmissionsSchemaStruct({
    EmissionsSchemaStruct? housing,
    EmissionsSchemaStruct? energy,
    EmissionsSchemaStruct? consumption,
  })  : _housing = housing,
        _energy = energy,
        _consumption = consumption;

  // "housing" field.
  EmissionsSchemaStruct? _housing;
  EmissionsSchemaStruct get housing => _housing ?? EmissionsSchemaStruct();
  set housing(EmissionsSchemaStruct? val) => _housing = val;

  void updateHousing(Function(EmissionsSchemaStruct) updateFn) {
    updateFn(_housing ??= EmissionsSchemaStruct());
  }

  bool hasHousing() => _housing != null;

  // "energy" field.
  EmissionsSchemaStruct? _energy;
  EmissionsSchemaStruct get energy => _energy ?? EmissionsSchemaStruct();
  set energy(EmissionsSchemaStruct? val) => _energy = val;

  void updateEnergy(Function(EmissionsSchemaStruct) updateFn) {
    updateFn(_energy ??= EmissionsSchemaStruct());
  }

  bool hasEnergy() => _energy != null;

  // "consumption" field.
  EmissionsSchemaStruct? _consumption;
  EmissionsSchemaStruct get consumption =>
      _consumption ?? EmissionsSchemaStruct();
  set consumption(EmissionsSchemaStruct? val) => _consumption = val;

  void updateConsumption(Function(EmissionsSchemaStruct) updateFn) {
    updateFn(_consumption ??= EmissionsSchemaStruct());
  }

  bool hasConsumption() => _consumption != null;

  static LifestyleEmissionsSchemaStruct fromMap(Map<String, dynamic> data) =>
      LifestyleEmissionsSchemaStruct(
        housing: data['housing'] is EmissionsSchemaStruct
            ? data['housing']
            : EmissionsSchemaStruct.maybeFromMap(data['housing']),
        energy: data['energy'] is EmissionsSchemaStruct
            ? data['energy']
            : EmissionsSchemaStruct.maybeFromMap(data['energy']),
        consumption: data['consumption'] is EmissionsSchemaStruct
            ? data['consumption']
            : EmissionsSchemaStruct.maybeFromMap(data['consumption']),
      );

  static LifestyleEmissionsSchemaStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? LifestyleEmissionsSchemaStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'housing': _housing?.toMap(),
        'energy': _energy?.toMap(),
        'consumption': _consumption?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'housing': serializeParam(
          _housing,
          ParamType.DataStruct,
        ),
        'energy': serializeParam(
          _energy,
          ParamType.DataStruct,
        ),
        'consumption': serializeParam(
          _consumption,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LifestyleEmissionsSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LifestyleEmissionsSchemaStruct(
        housing: deserializeStructParam(
          data['housing'],
          ParamType.DataStruct,
          false,
          structBuilder: EmissionsSchemaStruct.fromSerializableMap,
        ),
        energy: deserializeStructParam(
          data['energy'],
          ParamType.DataStruct,
          false,
          structBuilder: EmissionsSchemaStruct.fromSerializableMap,
        ),
        consumption: deserializeStructParam(
          data['consumption'],
          ParamType.DataStruct,
          false,
          structBuilder: EmissionsSchemaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LifestyleEmissionsSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LifestyleEmissionsSchemaStruct &&
        housing == other.housing &&
        energy == other.energy &&
        consumption == other.consumption;
  }

  @override
  int get hashCode => const ListEquality().hash([housing, energy, consumption]);
}

LifestyleEmissionsSchemaStruct createLifestyleEmissionsSchemaStruct({
  EmissionsSchemaStruct? housing,
  EmissionsSchemaStruct? energy,
  EmissionsSchemaStruct? consumption,
}) =>
    LifestyleEmissionsSchemaStruct(
      housing: housing ?? EmissionsSchemaStruct(),
      energy: energy ?? EmissionsSchemaStruct(),
      consumption: consumption ?? EmissionsSchemaStruct(),
    );
