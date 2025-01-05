// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LifestyleSchemaStruct extends BaseStruct {
  LifestyleSchemaStruct({
    int? houseType,
    int? heatingType,
    int? houseAge,
    int? temp,
    int? area,
    int? persons,
    int? warmWaterType,
    int? efficiency,
    int? fridge,
    int? washing,
    int? drying,
    int? eco,
    int? clothes,
    int? entertainment,
    int? furniture,
    int? eatOut,
    int? investments,
  })  : _houseType = houseType,
        _heatingType = heatingType,
        _houseAge = houseAge,
        _temp = temp,
        _area = area,
        _persons = persons,
        _warmWaterType = warmWaterType,
        _efficiency = efficiency,
        _fridge = fridge,
        _washing = washing,
        _drying = drying,
        _eco = eco,
        _clothes = clothes,
        _entertainment = entertainment,
        _furniture = furniture,
        _eatOut = eatOut,
        _investments = investments;

  // "houseType" field.
  int? _houseType;
  int get houseType => _houseType ?? 0;
  set houseType(int? val) => _houseType = val;

  void incrementHouseType(int amount) => houseType = houseType + amount;

  bool hasHouseType() => _houseType != null;

  // "heatingType" field.
  int? _heatingType;
  int get heatingType => _heatingType ?? 0;
  set heatingType(int? val) => _heatingType = val;

  void incrementHeatingType(int amount) => heatingType = heatingType + amount;

  bool hasHeatingType() => _heatingType != null;

  // "houseAge" field.
  int? _houseAge;
  int get houseAge => _houseAge ?? 0;
  set houseAge(int? val) => _houseAge = val;

  void incrementHouseAge(int amount) => houseAge = houseAge + amount;

  bool hasHouseAge() => _houseAge != null;

  // "temp" field.
  int? _temp;
  int get temp => _temp ?? 0;
  set temp(int? val) => _temp = val;

  void incrementTemp(int amount) => temp = temp + amount;

  bool hasTemp() => _temp != null;

  // "area" field.
  int? _area;
  int get area => _area ?? 0;
  set area(int? val) => _area = val;

  void incrementArea(int amount) => area = area + amount;

  bool hasArea() => _area != null;

  // "persons" field.
  int? _persons;
  int get persons => _persons ?? 0;
  set persons(int? val) => _persons = val;

  void incrementPersons(int amount) => persons = persons + amount;

  bool hasPersons() => _persons != null;

  // "warmWaterType" field.
  int? _warmWaterType;
  int get warmWaterType => _warmWaterType ?? 0;
  set warmWaterType(int? val) => _warmWaterType = val;

  void incrementWarmWaterType(int amount) =>
      warmWaterType = warmWaterType + amount;

  bool hasWarmWaterType() => _warmWaterType != null;

  // "efficiency" field.
  int? _efficiency;
  int get efficiency => _efficiency ?? 0;
  set efficiency(int? val) => _efficiency = val;

  void incrementEfficiency(int amount) => efficiency = efficiency + amount;

  bool hasEfficiency() => _efficiency != null;

  // "fridge" field.
  int? _fridge;
  int get fridge => _fridge ?? 0;
  set fridge(int? val) => _fridge = val;

  void incrementFridge(int amount) => fridge = fridge + amount;

  bool hasFridge() => _fridge != null;

  // "washing" field.
  int? _washing;
  int get washing => _washing ?? 0;
  set washing(int? val) => _washing = val;

  void incrementWashing(int amount) => washing = washing + amount;

  bool hasWashing() => _washing != null;

  // "drying" field.
  int? _drying;
  int get drying => _drying ?? 0;
  set drying(int? val) => _drying = val;

  void incrementDrying(int amount) => drying = drying + amount;

  bool hasDrying() => _drying != null;

  // "eco" field.
  int? _eco;
  int get eco => _eco ?? 0;
  set eco(int? val) => _eco = val;

  void incrementEco(int amount) => eco = eco + amount;

  bool hasEco() => _eco != null;

  // "clothes" field.
  int? _clothes;
  int get clothes => _clothes ?? 0;
  set clothes(int? val) => _clothes = val;

  void incrementClothes(int amount) => clothes = clothes + amount;

  bool hasClothes() => _clothes != null;

  // "entertainment" field.
  int? _entertainment;
  int get entertainment => _entertainment ?? 0;
  set entertainment(int? val) => _entertainment = val;

  void incrementEntertainment(int amount) =>
      entertainment = entertainment + amount;

  bool hasEntertainment() => _entertainment != null;

  // "furniture" field.
  int? _furniture;
  int get furniture => _furniture ?? 0;
  set furniture(int? val) => _furniture = val;

  void incrementFurniture(int amount) => furniture = furniture + amount;

  bool hasFurniture() => _furniture != null;

  // "eatOut" field.
  int? _eatOut;
  int get eatOut => _eatOut ?? 0;
  set eatOut(int? val) => _eatOut = val;

  void incrementEatOut(int amount) => eatOut = eatOut + amount;

  bool hasEatOut() => _eatOut != null;

  // "investments" field.
  int? _investments;
  int get investments => _investments ?? 0;
  set investments(int? val) => _investments = val;

  void incrementInvestments(int amount) => investments = investments + amount;

  bool hasInvestments() => _investments != null;

  static LifestyleSchemaStruct fromMap(Map<String, dynamic> data) =>
      LifestyleSchemaStruct(
        houseType: castToType<int>(data['houseType']),
        heatingType: castToType<int>(data['heatingType']),
        houseAge: castToType<int>(data['houseAge']),
        temp: castToType<int>(data['temp']),
        area: castToType<int>(data['area']),
        persons: castToType<int>(data['persons']),
        warmWaterType: castToType<int>(data['warmWaterType']),
        efficiency: castToType<int>(data['efficiency']),
        fridge: castToType<int>(data['fridge']),
        washing: castToType<int>(data['washing']),
        drying: castToType<int>(data['drying']),
        eco: castToType<int>(data['eco']),
        clothes: castToType<int>(data['clothes']),
        entertainment: castToType<int>(data['entertainment']),
        furniture: castToType<int>(data['furniture']),
        eatOut: castToType<int>(data['eatOut']),
        investments: castToType<int>(data['investments']),
      );

  static LifestyleSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? LifestyleSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'houseType': _houseType,
        'heatingType': _heatingType,
        'houseAge': _houseAge,
        'temp': _temp,
        'area': _area,
        'persons': _persons,
        'warmWaterType': _warmWaterType,
        'efficiency': _efficiency,
        'fridge': _fridge,
        'washing': _washing,
        'drying': _drying,
        'eco': _eco,
        'clothes': _clothes,
        'entertainment': _entertainment,
        'furniture': _furniture,
        'eatOut': _eatOut,
        'investments': _investments,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'houseType': serializeParam(
          _houseType,
          ParamType.int,
        ),
        'heatingType': serializeParam(
          _heatingType,
          ParamType.int,
        ),
        'houseAge': serializeParam(
          _houseAge,
          ParamType.int,
        ),
        'temp': serializeParam(
          _temp,
          ParamType.int,
        ),
        'area': serializeParam(
          _area,
          ParamType.int,
        ),
        'persons': serializeParam(
          _persons,
          ParamType.int,
        ),
        'warmWaterType': serializeParam(
          _warmWaterType,
          ParamType.int,
        ),
        'efficiency': serializeParam(
          _efficiency,
          ParamType.int,
        ),
        'fridge': serializeParam(
          _fridge,
          ParamType.int,
        ),
        'washing': serializeParam(
          _washing,
          ParamType.int,
        ),
        'drying': serializeParam(
          _drying,
          ParamType.int,
        ),
        'eco': serializeParam(
          _eco,
          ParamType.int,
        ),
        'clothes': serializeParam(
          _clothes,
          ParamType.int,
        ),
        'entertainment': serializeParam(
          _entertainment,
          ParamType.int,
        ),
        'furniture': serializeParam(
          _furniture,
          ParamType.int,
        ),
        'eatOut': serializeParam(
          _eatOut,
          ParamType.int,
        ),
        'investments': serializeParam(
          _investments,
          ParamType.int,
        ),
      }.withoutNulls;

  static LifestyleSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      LifestyleSchemaStruct(
        houseType: deserializeParam(
          data['houseType'],
          ParamType.int,
          false,
        ),
        heatingType: deserializeParam(
          data['heatingType'],
          ParamType.int,
          false,
        ),
        houseAge: deserializeParam(
          data['houseAge'],
          ParamType.int,
          false,
        ),
        temp: deserializeParam(
          data['temp'],
          ParamType.int,
          false,
        ),
        area: deserializeParam(
          data['area'],
          ParamType.int,
          false,
        ),
        persons: deserializeParam(
          data['persons'],
          ParamType.int,
          false,
        ),
        warmWaterType: deserializeParam(
          data['warmWaterType'],
          ParamType.int,
          false,
        ),
        efficiency: deserializeParam(
          data['efficiency'],
          ParamType.int,
          false,
        ),
        fridge: deserializeParam(
          data['fridge'],
          ParamType.int,
          false,
        ),
        washing: deserializeParam(
          data['washing'],
          ParamType.int,
          false,
        ),
        drying: deserializeParam(
          data['drying'],
          ParamType.int,
          false,
        ),
        eco: deserializeParam(
          data['eco'],
          ParamType.int,
          false,
        ),
        clothes: deserializeParam(
          data['clothes'],
          ParamType.int,
          false,
        ),
        entertainment: deserializeParam(
          data['entertainment'],
          ParamType.int,
          false,
        ),
        furniture: deserializeParam(
          data['furniture'],
          ParamType.int,
          false,
        ),
        eatOut: deserializeParam(
          data['eatOut'],
          ParamType.int,
          false,
        ),
        investments: deserializeParam(
          data['investments'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LifestyleSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LifestyleSchemaStruct &&
        houseType == other.houseType &&
        heatingType == other.heatingType &&
        houseAge == other.houseAge &&
        temp == other.temp &&
        area == other.area &&
        persons == other.persons &&
        warmWaterType == other.warmWaterType &&
        efficiency == other.efficiency &&
        fridge == other.fridge &&
        washing == other.washing &&
        drying == other.drying &&
        eco == other.eco &&
        clothes == other.clothes &&
        entertainment == other.entertainment &&
        furniture == other.furniture &&
        eatOut == other.eatOut &&
        investments == other.investments;
  }

  @override
  int get hashCode => const ListEquality().hash([
        houseType,
        heatingType,
        houseAge,
        temp,
        area,
        persons,
        warmWaterType,
        efficiency,
        fridge,
        washing,
        drying,
        eco,
        clothes,
        entertainment,
        furniture,
        eatOut,
        investments
      ]);
}

LifestyleSchemaStruct createLifestyleSchemaStruct({
  int? houseType,
  int? heatingType,
  int? houseAge,
  int? temp,
  int? area,
  int? persons,
  int? warmWaterType,
  int? efficiency,
  int? fridge,
  int? washing,
  int? drying,
  int? eco,
  int? clothes,
  int? entertainment,
  int? furniture,
  int? eatOut,
  int? investments,
}) =>
    LifestyleSchemaStruct(
      houseType: houseType,
      heatingType: heatingType,
      houseAge: houseAge,
      temp: temp,
      area: area,
      persons: persons,
      warmWaterType: warmWaterType,
      efficiency: efficiency,
      fridge: fridge,
      washing: washing,
      drying: drying,
      eco: eco,
      clothes: clothes,
      entertainment: entertainment,
      furniture: furniture,
      eatOut: eatOut,
      investments: investments,
    );
