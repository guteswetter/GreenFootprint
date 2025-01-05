// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MahlzeitListeTotalStruct extends BaseStruct {
  MahlzeitListeTotalStruct({
    int? mahlzeitID,
    int? itemID,
    int? entryID,
    String? datum,
    double? menge,
    double? co2,
  })  : _mahlzeitID = mahlzeitID,
        _itemID = itemID,
        _entryID = entryID,
        _datum = datum,
        _menge = menge,
        _co2 = co2;

  // "mahlzeitID" field.
  int? _mahlzeitID;
  int get mahlzeitID => _mahlzeitID ?? 0;
  set mahlzeitID(int? val) => _mahlzeitID = val;

  void incrementMahlzeitID(int amount) => mahlzeitID = mahlzeitID + amount;

  bool hasMahlzeitID() => _mahlzeitID != null;

  // "itemID" field.
  int? _itemID;
  int get itemID => _itemID ?? 0;
  set itemID(int? val) => _itemID = val;

  void incrementItemID(int amount) => itemID = itemID + amount;

  bool hasItemID() => _itemID != null;

  // "entryID" field.
  int? _entryID;
  int get entryID => _entryID ?? 0;
  set entryID(int? val) => _entryID = val;

  void incrementEntryID(int amount) => entryID = entryID + amount;

  bool hasEntryID() => _entryID != null;

  // "datum" field.
  String? _datum;
  String get datum => _datum ?? '';
  set datum(String? val) => _datum = val;

  bool hasDatum() => _datum != null;

  // "menge" field.
  double? _menge;
  double get menge => _menge ?? 0.0;
  set menge(double? val) => _menge = val;

  void incrementMenge(double amount) => menge = menge + amount;

  bool hasMenge() => _menge != null;

  // "co2" field.
  double? _co2;
  double get co2 => _co2 ?? 0.0;
  set co2(double? val) => _co2 = val;

  void incrementCo2(double amount) => co2 = co2 + amount;

  bool hasCo2() => _co2 != null;

  static MahlzeitListeTotalStruct fromMap(Map<String, dynamic> data) =>
      MahlzeitListeTotalStruct(
        mahlzeitID: castToType<int>(data['mahlzeitID']),
        itemID: castToType<int>(data['itemID']),
        entryID: castToType<int>(data['entryID']),
        datum: data['datum'] as String?,
        menge: castToType<double>(data['menge']),
        co2: castToType<double>(data['co2']),
      );

  static MahlzeitListeTotalStruct? maybeFromMap(dynamic data) => data is Map
      ? MahlzeitListeTotalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mahlzeitID': _mahlzeitID,
        'itemID': _itemID,
        'entryID': _entryID,
        'datum': _datum,
        'menge': _menge,
        'co2': _co2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mahlzeitID': serializeParam(
          _mahlzeitID,
          ParamType.int,
        ),
        'itemID': serializeParam(
          _itemID,
          ParamType.int,
        ),
        'entryID': serializeParam(
          _entryID,
          ParamType.int,
        ),
        'datum': serializeParam(
          _datum,
          ParamType.String,
        ),
        'menge': serializeParam(
          _menge,
          ParamType.double,
        ),
        'co2': serializeParam(
          _co2,
          ParamType.double,
        ),
      }.withoutNulls;

  static MahlzeitListeTotalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MahlzeitListeTotalStruct(
        mahlzeitID: deserializeParam(
          data['mahlzeitID'],
          ParamType.int,
          false,
        ),
        itemID: deserializeParam(
          data['itemID'],
          ParamType.int,
          false,
        ),
        entryID: deserializeParam(
          data['entryID'],
          ParamType.int,
          false,
        ),
        datum: deserializeParam(
          data['datum'],
          ParamType.String,
          false,
        ),
        menge: deserializeParam(
          data['menge'],
          ParamType.double,
          false,
        ),
        co2: deserializeParam(
          data['co2'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MahlzeitListeTotalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MahlzeitListeTotalStruct &&
        mahlzeitID == other.mahlzeitID &&
        itemID == other.itemID &&
        entryID == other.entryID &&
        datum == other.datum &&
        menge == other.menge &&
        co2 == other.co2;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mahlzeitID, itemID, entryID, datum, menge, co2]);
}

MahlzeitListeTotalStruct createMahlzeitListeTotalStruct({
  int? mahlzeitID,
  int? itemID,
  int? entryID,
  String? datum,
  double? menge,
  double? co2,
}) =>
    MahlzeitListeTotalStruct(
      mahlzeitID: mahlzeitID,
      itemID: itemID,
      entryID: entryID,
      datum: datum,
      menge: menge,
      co2: co2,
    );
