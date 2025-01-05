// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlightSchemaStruct extends BaseStruct {
  FlightSchemaStruct({
    int? id,
    int? user,
    String? origin,
    String? destination,
    int? flightClass,
    int? kilometer,
    double? co2eq,
    int? ubp,
    String? date,
  })  : _id = id,
        _user = user,
        _origin = origin,
        _destination = destination,
        _flightClass = flightClass,
        _kilometer = kilometer,
        _co2eq = co2eq,
        _ubp = ubp,
        _date = date;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user" field.
  int? _user;
  int get user => _user ?? 0;
  set user(int? val) => _user = val;

  void incrementUser(int amount) => user = user + amount;

  bool hasUser() => _user != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  set origin(String? val) => _origin = val;

  bool hasOrigin() => _origin != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  set destination(String? val) => _destination = val;

  bool hasDestination() => _destination != null;

  // "flightClass" field.
  int? _flightClass;
  int get flightClass => _flightClass ?? 0;
  set flightClass(int? val) => _flightClass = val;

  void incrementFlightClass(int amount) => flightClass = flightClass + amount;

  bool hasFlightClass() => _flightClass != null;

  // "kilometer" field.
  int? _kilometer;
  int get kilometer => _kilometer ?? 0;
  set kilometer(int? val) => _kilometer = val;

  void incrementKilometer(int amount) => kilometer = kilometer + amount;

  bool hasKilometer() => _kilometer != null;

  // "co2eq" field.
  double? _co2eq;
  double get co2eq => _co2eq ?? 0.0;
  set co2eq(double? val) => _co2eq = val;

  void incrementCo2eq(double amount) => co2eq = co2eq + amount;

  bool hasCo2eq() => _co2eq != null;

  // "ubp" field.
  int? _ubp;
  int get ubp => _ubp ?? 0;
  set ubp(int? val) => _ubp = val;

  void incrementUbp(int amount) => ubp = ubp + amount;

  bool hasUbp() => _ubp != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  static FlightSchemaStruct fromMap(Map<String, dynamic> data) =>
      FlightSchemaStruct(
        id: castToType<int>(data['id']),
        user: castToType<int>(data['user']),
        origin: data['origin'] as String?,
        destination: data['destination'] as String?,
        flightClass: castToType<int>(data['flightClass']),
        kilometer: castToType<int>(data['kilometer']),
        co2eq: castToType<double>(data['co2eq']),
        ubp: castToType<int>(data['ubp']),
        date: data['date'] as String?,
      );

  static FlightSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? FlightSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user': _user,
        'origin': _origin,
        'destination': _destination,
        'flightClass': _flightClass,
        'kilometer': _kilometer,
        'co2eq': _co2eq,
        'ubp': _ubp,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user': serializeParam(
          _user,
          ParamType.int,
        ),
        'origin': serializeParam(
          _origin,
          ParamType.String,
        ),
        'destination': serializeParam(
          _destination,
          ParamType.String,
        ),
        'flightClass': serializeParam(
          _flightClass,
          ParamType.int,
        ),
        'kilometer': serializeParam(
          _kilometer,
          ParamType.int,
        ),
        'co2eq': serializeParam(
          _co2eq,
          ParamType.double,
        ),
        'ubp': serializeParam(
          _ubp,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlightSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlightSchemaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.int,
          false,
        ),
        origin: deserializeParam(
          data['origin'],
          ParamType.String,
          false,
        ),
        destination: deserializeParam(
          data['destination'],
          ParamType.String,
          false,
        ),
        flightClass: deserializeParam(
          data['flightClass'],
          ParamType.int,
          false,
        ),
        kilometer: deserializeParam(
          data['kilometer'],
          ParamType.int,
          false,
        ),
        co2eq: deserializeParam(
          data['co2eq'],
          ParamType.double,
          false,
        ),
        ubp: deserializeParam(
          data['ubp'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FlightSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlightSchemaStruct &&
        id == other.id &&
        user == other.user &&
        origin == other.origin &&
        destination == other.destination &&
        flightClass == other.flightClass &&
        kilometer == other.kilometer &&
        co2eq == other.co2eq &&
        ubp == other.ubp &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        user,
        origin,
        destination,
        flightClass,
        kilometer,
        co2eq,
        ubp,
        date
      ]);
}

FlightSchemaStruct createFlightSchemaStruct({
  int? id,
  int? user,
  String? origin,
  String? destination,
  int? flightClass,
  int? kilometer,
  double? co2eq,
  int? ubp,
  String? date,
}) =>
    FlightSchemaStruct(
      id: id,
      user: user,
      origin: origin,
      destination: destination,
      flightClass: flightClass,
      kilometer: kilometer,
      co2eq: co2eq,
      ubp: ubp,
      date: date,
    );
