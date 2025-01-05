// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetItemPerDateSchemaStruct extends BaseStruct {
  GetItemPerDateSchemaStruct({
    String? date,
    int? id,
    int? item,
    double? amountNumeric,
    int? amountOption,
  })  : _date = date,
        _id = id,
        _item = item,
        _amountNumeric = amountNumeric,
        _amountOption = amountOption;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "item" field.
  int? _item;
  int get item => _item ?? 0;
  set item(int? val) => _item = val;

  void incrementItem(int amount) => item = item + amount;

  bool hasItem() => _item != null;

  // "amountNumeric" field.
  double? _amountNumeric;
  double get amountNumeric => _amountNumeric ?? 0.0;
  set amountNumeric(double? val) => _amountNumeric = val;

  void incrementAmountNumeric(double amount) =>
      amountNumeric = amountNumeric + amount;

  bool hasAmountNumeric() => _amountNumeric != null;

  // "amountOption" field.
  int? _amountOption;
  int get amountOption => _amountOption ?? 0;
  set amountOption(int? val) => _amountOption = val;

  void incrementAmountOption(int amount) =>
      amountOption = amountOption + amount;

  bool hasAmountOption() => _amountOption != null;

  static GetItemPerDateSchemaStruct fromMap(Map<String, dynamic> data) =>
      GetItemPerDateSchemaStruct(
        date: data['date'] as String?,
        id: castToType<int>(data['id']),
        item: castToType<int>(data['item']),
        amountNumeric: castToType<double>(data['amountNumeric']),
        amountOption: castToType<int>(data['amountOption']),
      );

  static GetItemPerDateSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? GetItemPerDateSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'id': _id,
        'item': _item,
        'amountNumeric': _amountNumeric,
        'amountOption': _amountOption,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'item': serializeParam(
          _item,
          ParamType.int,
        ),
        'amountNumeric': serializeParam(
          _amountNumeric,
          ParamType.double,
        ),
        'amountOption': serializeParam(
          _amountOption,
          ParamType.int,
        ),
      }.withoutNulls;

  static GetItemPerDateSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetItemPerDateSchemaStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        item: deserializeParam(
          data['item'],
          ParamType.int,
          false,
        ),
        amountNumeric: deserializeParam(
          data['amountNumeric'],
          ParamType.double,
          false,
        ),
        amountOption: deserializeParam(
          data['amountOption'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GetItemPerDateSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetItemPerDateSchemaStruct &&
        date == other.date &&
        id == other.id &&
        item == other.item &&
        amountNumeric == other.amountNumeric &&
        amountOption == other.amountOption;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, id, item, amountNumeric, amountOption]);
}

GetItemPerDateSchemaStruct createGetItemPerDateSchemaStruct({
  String? date,
  int? id,
  int? item,
  double? amountNumeric,
  int? amountOption,
}) =>
    GetItemPerDateSchemaStruct(
      date: date,
      id: id,
      item: item,
      amountNumeric: amountNumeric,
      amountOption: amountOption,
    );
