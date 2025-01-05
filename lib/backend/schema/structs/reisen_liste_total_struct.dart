// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReisenListeTotalStruct extends BaseStruct {
  ReisenListeTotalStruct({
    int? reiseID,
    int? itemID,
    int? entryID,
    String? datum,
    double? menge,
  })  : _reiseID = reiseID,
        _itemID = itemID,
        _entryID = entryID,
        _datum = datum,
        _menge = menge;

  // "reiseID" field.
  int? _reiseID;
  int get reiseID => _reiseID ?? 0;
  set reiseID(int? val) => _reiseID = val;

  void incrementReiseID(int amount) => reiseID = reiseID + amount;

  bool hasReiseID() => _reiseID != null;

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

  static ReisenListeTotalStruct fromMap(Map<String, dynamic> data) =>
      ReisenListeTotalStruct(
        reiseID: castToType<int>(data['reiseID']),
        itemID: castToType<int>(data['itemID']),
        entryID: castToType<int>(data['entryID']),
        datum: data['datum'] as String?,
        menge: castToType<double>(data['menge']),
      );

  static ReisenListeTotalStruct? maybeFromMap(dynamic data) => data is Map
      ? ReisenListeTotalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'reiseID': _reiseID,
        'itemID': _itemID,
        'entryID': _entryID,
        'datum': _datum,
        'menge': _menge,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reiseID': serializeParam(
          _reiseID,
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
      }.withoutNulls;

  static ReisenListeTotalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ReisenListeTotalStruct(
        reiseID: deserializeParam(
          data['reiseID'],
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
      );

  @override
  String toString() => 'ReisenListeTotalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReisenListeTotalStruct &&
        reiseID == other.reiseID &&
        itemID == other.itemID &&
        entryID == other.entryID &&
        datum == other.datum &&
        menge == other.menge;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([reiseID, itemID, entryID, datum, menge]);
}

ReisenListeTotalStruct createReisenListeTotalStruct({
  int? reiseID,
  int? itemID,
  int? entryID,
  String? datum,
  double? menge,
}) =>
    ReisenListeTotalStruct(
      reiseID: reiseID,
      itemID: itemID,
      entryID: entryID,
      datum: datum,
      menge: menge,
    );
