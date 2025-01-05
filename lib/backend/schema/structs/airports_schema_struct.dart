// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirportsSchemaStruct extends BaseStruct {
  AirportsSchemaStruct({
    String? icao,
    String? iata,
    String? name,
    String? city,
    String? state,
    String? country,
    String? countryName,
    int? elevation,
    double? lat,
    double? lon,
    String? tz,
    String? ac,
    String? an,
    String? cn,
    String? cc,
    String? ct,
  })  : _icao = icao,
        _iata = iata,
        _name = name,
        _city = city,
        _state = state,
        _country = country,
        _countryName = countryName,
        _elevation = elevation,
        _lat = lat,
        _lon = lon,
        _tz = tz,
        _ac = ac,
        _an = an,
        _cn = cn,
        _cc = cc,
        _ct = ct;

  // "icao" field.
  String? _icao;
  String get icao => _icao ?? '';
  set icao(String? val) => _icao = val;

  bool hasIcao() => _icao != null;

  // "iata" field.
  String? _iata;
  String get iata => _iata ?? '';
  set iata(String? val) => _iata = val;

  bool hasIata() => _iata != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "country_name" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  set countryName(String? val) => _countryName = val;

  bool hasCountryName() => _countryName != null;

  // "elevation" field.
  int? _elevation;
  int get elevation => _elevation ?? 0;
  set elevation(int? val) => _elevation = val;

  void incrementElevation(int amount) => elevation = elevation + amount;

  bool hasElevation() => _elevation != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lon" field.
  double? _lon;
  double get lon => _lon ?? 0.0;
  set lon(double? val) => _lon = val;

  void incrementLon(double amount) => lon = lon + amount;

  bool hasLon() => _lon != null;

  // "tz" field.
  String? _tz;
  String get tz => _tz ?? '';
  set tz(String? val) => _tz = val;

  bool hasTz() => _tz != null;

  // "ac" field.
  String? _ac;
  String get ac => _ac ?? '';
  set ac(String? val) => _ac = val;

  bool hasAc() => _ac != null;

  // "an" field.
  String? _an;
  String get an => _an ?? '';
  set an(String? val) => _an = val;

  bool hasAn() => _an != null;

  // "cn" field.
  String? _cn;
  String get cn => _cn ?? '';
  set cn(String? val) => _cn = val;

  bool hasCn() => _cn != null;

  // "cc" field.
  String? _cc;
  String get cc => _cc ?? '';
  set cc(String? val) => _cc = val;

  bool hasCc() => _cc != null;

  // "ct" field.
  String? _ct;
  String get ct => _ct ?? '';
  set ct(String? val) => _ct = val;

  bool hasCt() => _ct != null;

  static AirportsSchemaStruct fromMap(Map<String, dynamic> data) =>
      AirportsSchemaStruct(
        icao: data['icao'] as String?,
        iata: data['iata'] as String?,
        name: data['name'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        countryName: data['country_name'] as String?,
        elevation: castToType<int>(data['elevation']),
        lat: castToType<double>(data['lat']),
        lon: castToType<double>(data['lon']),
        tz: data['tz'] as String?,
        ac: data['ac'] as String?,
        an: data['an'] as String?,
        cn: data['cn'] as String?,
        cc: data['cc'] as String?,
        ct: data['ct'] as String?,
      );

  static AirportsSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? AirportsSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'icao': _icao,
        'iata': _iata,
        'name': _name,
        'city': _city,
        'state': _state,
        'country': _country,
        'country_name': _countryName,
        'elevation': _elevation,
        'lat': _lat,
        'lon': _lon,
        'tz': _tz,
        'ac': _ac,
        'an': _an,
        'cn': _cn,
        'cc': _cc,
        'ct': _ct,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'icao': serializeParam(
          _icao,
          ParamType.String,
        ),
        'iata': serializeParam(
          _iata,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'country_name': serializeParam(
          _countryName,
          ParamType.String,
        ),
        'elevation': serializeParam(
          _elevation,
          ParamType.int,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lon': serializeParam(
          _lon,
          ParamType.double,
        ),
        'tz': serializeParam(
          _tz,
          ParamType.String,
        ),
        'ac': serializeParam(
          _ac,
          ParamType.String,
        ),
        'an': serializeParam(
          _an,
          ParamType.String,
        ),
        'cn': serializeParam(
          _cn,
          ParamType.String,
        ),
        'cc': serializeParam(
          _cc,
          ParamType.String,
        ),
        'ct': serializeParam(
          _ct,
          ParamType.String,
        ),
      }.withoutNulls;

  static AirportsSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AirportsSchemaStruct(
        icao: deserializeParam(
          data['icao'],
          ParamType.String,
          false,
        ),
        iata: deserializeParam(
          data['iata'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        countryName: deserializeParam(
          data['country_name'],
          ParamType.String,
          false,
        ),
        elevation: deserializeParam(
          data['elevation'],
          ParamType.int,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lon: deserializeParam(
          data['lon'],
          ParamType.double,
          false,
        ),
        tz: deserializeParam(
          data['tz'],
          ParamType.String,
          false,
        ),
        ac: deserializeParam(
          data['ac'],
          ParamType.String,
          false,
        ),
        an: deserializeParam(
          data['an'],
          ParamType.String,
          false,
        ),
        cn: deserializeParam(
          data['cn'],
          ParamType.String,
          false,
        ),
        cc: deserializeParam(
          data['cc'],
          ParamType.String,
          false,
        ),
        ct: deserializeParam(
          data['ct'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AirportsSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AirportsSchemaStruct &&
        icao == other.icao &&
        iata == other.iata &&
        name == other.name &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        countryName == other.countryName &&
        elevation == other.elevation &&
        lat == other.lat &&
        lon == other.lon &&
        tz == other.tz &&
        ac == other.ac &&
        an == other.an &&
        cn == other.cn &&
        cc == other.cc &&
        ct == other.ct;
  }

  @override
  int get hashCode => const ListEquality().hash([
        icao,
        iata,
        name,
        city,
        state,
        country,
        countryName,
        elevation,
        lat,
        lon,
        tz,
        ac,
        an,
        cn,
        cc,
        ct
      ]);
}

AirportsSchemaStruct createAirportsSchemaStruct({
  String? icao,
  String? iata,
  String? name,
  String? city,
  String? state,
  String? country,
  String? countryName,
  int? elevation,
  double? lat,
  double? lon,
  String? tz,
  String? ac,
  String? an,
  String? cn,
  String? cc,
  String? ct,
}) =>
    AirportsSchemaStruct(
      icao: icao,
      iata: iata,
      name: name,
      city: city,
      state: state,
      country: country,
      countryName: countryName,
      elevation: elevation,
      lat: lat,
      lon: lon,
      tz: tz,
      ac: ac,
      an: an,
      cn: cn,
      cc: cc,
      ct: ct,
    );
