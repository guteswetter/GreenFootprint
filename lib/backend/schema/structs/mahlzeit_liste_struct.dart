// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MahlzeitListeStruct extends BaseStruct {
  MahlzeitListeStruct({
    int? mahlzeitID,
    int? itemID,
    String? datum,
    double? menge,
    int? entryID,
    double? co2,
  })  : _mahlzeitID = mahlzeitID,
        _itemID = itemID,
        _datum = datum,
        _menge = menge,
        _entryID = entryID,
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

  // "entryID" field.
  int? _entryID;
  int get entryID => _entryID ?? 0;
  set entryID(int? val) => _entryID = val;

  void incrementEntryID(int amount) => entryID = entryID + amount;

  bool hasEntryID() => _entryID != null;

  // "co2" field.
  double? _co2;
  double get co2 => _co2 ?? 0.0;
  set co2(double? val) => _co2 = val;

  void incrementCo2(double amount) => co2 = co2 + amount;

  bool hasCo2() => _co2 != null;

  static MahlzeitListeStruct fromMap(Map<String, dynamic> data) =>
      MahlzeitListeStruct(
        mahlzeitID: castToType<int>(data['mahlzeitID']),
        itemID: castToType<int>(data['itemID']),
        datum: data['datum'] as String?,
        menge: castToType<double>(data['menge']),
        entryID: castToType<int>(data['entryID']),
        co2: castToType<double>(data['co2']),
      );

  static MahlzeitListeStruct? maybeFromMap(dynamic data) => data is Map
      ? MahlzeitListeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mahlzeitID': _mahlzeitID,
        'itemID': _itemID,
        'datum': _datum,
        'menge': _menge,
        'entryID': _entryID,
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
        'datum': serializeParam(
          _datum,
          ParamType.String,
        ),
        'menge': serializeParam(
          _menge,
          ParamType.double,
        ),
        'entryID': serializeParam(
          _entryID,
          ParamType.int,
        ),
        'co2': serializeParam(
          _co2,
          ParamType.double,
        ),
      }.withoutNulls;

  static MahlzeitListeStruct fromSerializableMap(Map<String, dynamic> data) =>
      MahlzeitListeStruct(
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
        entryID: deserializeParam(
          data['entryID'],
          ParamType.int,
          false,
        ),
        co2: deserializeParam(
          data['co2'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MahlzeitListeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MahlzeitListeStruct &&
        mahlzeitID == other.mahlzeitID &&
        itemID == other.itemID &&
        datum == other.datum &&
        menge == other.menge &&
        entryID == other.entryID &&
        co2 == other.co2;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mahlzeitID, itemID, datum, menge, entryID, co2]);
}

MahlzeitListeStruct createMahlzeitListeStruct({
  int? mahlzeitID,
  int? itemID,
  String? datum,
  double? menge,
  int? entryID,
  double? co2,
}) =>
    MahlzeitListeStruct(
      mahlzeitID: mahlzeitID,
      itemID: itemID,
      datum: datum,
      menge: menge,
      entryID: entryID,
      co2: co2,
    );
