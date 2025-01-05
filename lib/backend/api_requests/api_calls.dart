import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start myclimate calculator APIs Group Code

class MyclimateCalculatorAPIsGroup {
  static String getBaseUrl() => 'https://api.myclimate.org';
  static Map<String, String> headers = {};
  static PostV1FlightCalculatorsJsonCall postV1FlightCalculatorsJsonCall =
      PostV1FlightCalculatorsJsonCall();
  static PostV1CarCalculatorsJsonCall postV1CarCalculatorsJsonCall =
      PostV1CarCalculatorsJsonCall();
  static PostV1CruiseCalculatorsJsonCall postV1CruiseCalculatorsJsonCall =
      PostV1CruiseCalculatorsJsonCall();
  static PostV1BulkFlightCalculatorsJsonCall
      postV1BulkFlightCalculatorsJsonCall =
      PostV1BulkFlightCalculatorsJsonCall();
  static PostV1BulkCarCalculatorsJsonCall postV1BulkCarCalculatorsJsonCall =
      PostV1BulkCarCalculatorsJsonCall();
  static PostV1CompanyCalculatorsJsonCall postV1CompanyCalculatorsJsonCall =
      PostV1CompanyCalculatorsJsonCall();
  static PostV1BulkFlightCalculatorsCsvCall postV1BulkFlightCalculatorsCsvCall =
      PostV1BulkFlightCalculatorsCsvCall();
  static PostV1BulkCarCalculatorsCsvCall postV1BulkCarCalculatorsCsvCall =
      PostV1BulkCarCalculatorsCsvCall();
  static PostV1FootprintCalculatorsJsonCall postV1FootprintCalculatorsJsonCall =
      PostV1FootprintCalculatorsJsonCall();
}

class PostV1FlightCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "from": "ZRH",
  "to": "FRA",
  "via": "LHR",
  "passengers": 2,
  "roundtrip": true,
  "flight_class": "economy"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-flight_calculators.json',
      apiUrl: '$baseUrl/v1/flight_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1CarCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "car_type": "midsize",
  "fuel_type": "diesel",
  "fuel_consumption": 5.6,
  "km": 1345.5,
  "electric_location": "ch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-car_calculators.json',
      apiUrl: '$baseUrl/v1/car_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1CruiseCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "cruise_duration": 14,
  "cruise_cabin_type": 0,
  "cruise_size_class": 3,
  "number_of_compensations": 2,
  "number_of_occupants": 2,
  "cruise_days_with_port_call": 12
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-cruise_calculators.json',
      apiUrl: '$baseUrl/v1/cruise_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1BulkFlightCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "flights": [
    {
      "id": "abc5698",
      "from": "ZRH",
      "to": "ZRH",
      "flight_class": "economy"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-bulk_flight_calculators.json',
      apiUrl: '$baseUrl/v1/bulk_flight_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1BulkCarCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "trips": [
    {
      "id": "abc456",
      "km": 0,
      "car_type": "",
      "fuel_type": "",
      "fuel_consumption": 0,
      "electric_location": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-bulk_car_calculators.json',
      apiUrl: '$baseUrl/v1/bulk_car_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1CompanyCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "name": "Acme Inc",
  "country": "DE",
  "number_of_employees": 1.4,
  "heated_area": 200,
  "home_office_per_cent": 30,
  "estimate_energy": "1",
  "power_consumption_kwh": 2234.3,
  "green_electricity": true,
  "oil_liters": 5304.5,
  "natural_gas_m3": 230.4,
  "biogas_m3": 304.2,
  "district_heat_kwh": 2304.3,
  "heat_pump": true,
  "wood_kwh": 1203.9,
  "estimate_digital_services": "1",
  "cloud_storage_gbyte": 1203.9,
  "web_data_transfer_gbyte": 1203.9,
  "estimate_commuting_mobility": "1",
  "commuted_yearly_public_transportation_km": 0,
  "commuted_yearly_car_km": 0,
  "estimate_business_trip_mobility": "1",
  "consider_advanced_business_trip_inputs": "1",
  "business_yearly_car_km": 0,
  "car_fuel_electric_kwh": 0,
  "car_fuel_gasoline_liters": 0,
  "car_fuel_diesel_liters": 0,
  "car_fuel_natural_gas_kg": 0,
  "car_fuel_biogas_kg": 0,
  "business_yearly_public_transportation_km": 0,
  "hotel_nights_amount": 0,
  "short_flights_amount": 0,
  "medium_flights_amount": 0,
  "long_flights_amount": 0,
  "business_or_first_flights_per_cent": 50.3,
  "estimate_food_and_beverages": "1",
  "warm_meal_meat_amount": 0,
  "warm_meal_vegetarian_amount": 0,
  "snacks": 0,
  "soda_liters": 0,
  "coffee_portions": 0,
  "tea_portions": 0,
  "estimate_supplies": "1",
  "consider_advanced_supplies_inputs": "1",
  "paper_kg": 0,
  "paper_recycling_paper_per_cent": 0,
  "printed_matters_kg": 0,
  "electronic_devices_amount": 0,
  "toners_amount": 0,
  "water_m3": 0,
  "garbage_kg": 0,
  "garbage_recycling_kg": 0,
  "garbage_electronics_kg": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-company_calculators.json',
      apiUrl: '$baseUrl/v1/company_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1BulkFlightCalculatorsCsvCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-bulk_flight_calculators-csv',
      apiUrl: '$baseUrl/v1/bulk_flight_calculators',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1BulkCarCalculatorsCsvCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-bulk_car_calculators-csv',
      apiUrl: '$baseUrl/v1/bulk_car_calculators',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostV1FootprintCalculatorsJsonCall {
  Future<ApiCallResponse> call({
    String? basic = '',
  }) async {
    final baseUrl = MyclimateCalculatorAPIsGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "mobility_vehicles": "high",
  "mobility_flight": "medium",
  "consumption_food": "giant",
  "consumption_shopping": "high",
  "household_area": "low",
  "household_building": "high",
  "household_heating": "high"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post-v1-footprint_calculators.json',
      apiUrl: '$baseUrl/v1/footprint_calculators.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End myclimate calculator APIs Group Code

/// Start Me and My Planet (Mock) API Group Code

class MeAndMyPlanetMockAPIGroup {
  static String getBaseUrl() => 'https://mmp-mockapi.pantek.app';
  static Map<String, String> headers = {};
  static RequestInformationAboutTheGroupTheUserIsPartOfCall
      requestInformationAboutTheGroupTheUserIsPartOfCall =
      RequestInformationAboutTheGroupTheUserIsPartOfCall();
  static RequestUserDataOfACertainCategoryByIDCall
      requestUserDataOfACertainCategoryByIDCall =
      RequestUserDataOfACertainCategoryByIDCall();
  static RequestUserDataOfACertainCategoryByDateCall
      requestUserDataOfACertainCategoryByDateCall =
      RequestUserDataOfACertainCategoryByDateCall();
  static AddDailyCall addDailyCall = AddDailyCall();
  static EditExistingDataInDatabaseByEntryIDCall
      editExistingDataInDatabaseByEntryIDCall =
      EditExistingDataInDatabaseByEntryIDCall();
  static RemoveExistingDailyTrackerEntryCall
      removeExistingDailyTrackerEntryCall =
      RemoveExistingDailyTrackerEntryCall();
  static ListAllFlightsForThisUserCall listAllFlightsForThisUserCall =
      ListAllFlightsForThisUserCall();
  static AddFlightToDatabaseCall addFlightToDatabaseCall =
      AddFlightToDatabaseCall();
  static RemoveFlightFromDatabaseCall removeFlightFromDatabaseCall =
      RemoveFlightFromDatabaseCall();
  static GetLifestyleEmissionsForUserCall getLifestyleEmissionsForUserCall =
      GetLifestyleEmissionsForUserCall();
  static GetLifestyleSettingsForUserCall getLifestyleSettingsForUserCall =
      GetLifestyleSettingsForUserCall();
  static SaveNewLifestyleSettingsForUserCall
      saveNewLifestyleSettingsForUserCall =
      SaveNewLifestyleSettingsForUserCall();
  static RequestCategoryMetadataCall requestCategoryMetadataCall =
      RequestCategoryMetadataCall();
  static RequestItemsMetadataCall requestItemsMetadataCall =
      RequestItemsMetadataCall();
  static RequestUnitsMetadataCall requestUnitsMetadataCall =
      RequestUnitsMetadataCall();
  static RequestUnitOptionsMetadataCall requestUnitOptionsMetadataCall =
      RequestUnitOptionsMetadataCall();
  static UserAuthorizationCall userAuthorizationCall = UserAuthorizationCall();
}

class RequestInformationAboutTheGroupTheUserIsPartOfCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request information about the group the user is part of',
      apiUrl: '$baseUrl/myData/groupInfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? periodStart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.periodStart''',
      ));
  String? periodEnd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.periodEnd''',
      ));
}

class RequestUserDataOfACertainCategoryByIDCall {
  Future<ApiCallResponse> call({
    String? categoryID = '',
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request user data of a certain category by ID',
      apiUrl: '$baseUrl/myData/byCategory/$categoryID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? itemID(dynamic response) => (getJsonField(
        response,
        r'''$[:].item''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? amountNumeric(dynamic response) => (getJsonField(
        response,
        r'''$[:].amountNumeric''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? amountOption(dynamic response) => (getJsonField(
        response,
        r'''$[:].amountOption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RequestUserDataOfACertainCategoryByDateCall {
  Future<ApiCallResponse> call({
    String? dateString = '',
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request user data of a certain category by date',
      apiUrl: '$baseUrl/myData/byDate/$dateString',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? item(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].item''',
      ));
  int? amountNumeric(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].amountNumeric''',
      ));
  int? amountOption(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].amountOption''',
      ));
}

class AddDailyCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? date = '',
    double? amountNumeric,
    int? amountOption,
    int? itemID,
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "date": "${escapeStringForJson(date)}",
  "amountNumeric": $amountNumeric,
  "amountOption": $amountOption,
  "itemID": $itemID
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addDaily',
      apiUrl: '$baseUrl/myData/addDaily',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? entryID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.lastID''',
      ));
  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.err''',
      ));
}

class EditExistingDataInDatabaseByEntryIDCall {
  Future<ApiCallResponse> call({
    String? entryID = '',
    String? bearerAuth = '',
    double? amountNumeric,
    int? amountOption = 0,
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amountNumeric": $amountNumeric,
  "amountOption": $amountOption
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit existing data in database by entry ID',
      apiUrl: '$baseUrl/myData/updateDaily/$entryID',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveExistingDailyTrackerEntryCall {
  Future<ApiCallResponse> call({
    String? entryID = '',
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove existing daily tracker entry',
      apiUrl: '$baseUrl/myData/removeDaily/$entryID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAllFlightsForThisUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List all flights for this user',
      apiUrl: '$baseUrl/myData/listFlights',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].user''',
      ));
  String? origin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].origin''',
      ));
  String? destination(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].destination''',
      ));
  int? flightClass(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].flightClass''',
      ));
  int? kilometer(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].kilometer''',
      ));
  double? co2eq(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].co2eq''',
      ));
  int? ubp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].ubp''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date''',
      ));
}

class AddFlightToDatabaseCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? originCode = '',
    String? destinationCode = '',
    String? flightClass = '',
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add flight to database',
      apiUrl:
          '$baseUrl/myData/addFlight/$date/$originCode/$destinationCode/$flightClass',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveFlightFromDatabaseCall {
  Future<ApiCallResponse> call({
    String? flightID = '',
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove flight from database',
      apiUrl: '$baseUrl/myData/removeFlight/$flightID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLifestyleEmissionsForUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get lifestyle emissions for user',
      apiUrl: '$baseUrl/myData/lifestyle/emissions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? housingCO2(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.housing_co2''',
      ));
  double? energyCO2(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.energy_co2''',
      ));
}

class GetLifestyleSettingsForUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get lifestyle settings for user',
      apiUrl: '$baseUrl/myData/lifestyle',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? houseAge(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.houseAge''',
      ));
  int? temp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.temp''',
      ));
  int? area(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.area''',
      ));
  int? persons(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.persons''',
      ));
  int? warmWaterType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.warmWaterType''',
      ));
  int? heatingType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.heatingType''',
      ));
  int? houseType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.houseType''',
      ));
  int? efficiency(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.efficiency''',
      ));
  int? fridge(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fridge''',
      ));
  int? washing(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.washing''',
      ));
  int? drying(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.drying''',
      ));
  int? eco(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.eco''',
      ));
  int? clothes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.clothes''',
      ));
  int? furniture(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.furniture''',
      ));
  int? eatOut(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.eatOut''',
      ));
  int? entertainment(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.entertainment''',
      ));
  int? investments(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.investements''',
      ));
}

class SaveNewLifestyleSettingsForUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
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
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "houseType": $houseType,
  "heatingType": $heatingType,
  "houseAge": $houseAge,
  "temp": $temp,
  "area": $area,
  "persons": $persons,
  "warmWaterType": $warmWaterType,
  "efficiency": $efficiency,
  "fridge": $fridge,
  "washing": $washing,
  "drying": $drying,
  "eco": $eco,
  "clothes": $clothes,
  "entertainment": $entertainment,
  "furniture": $furniture,
  "eatOut": $eatOut,
  "investments": $investments
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save new lifestyle settings for user',
      apiUrl: '$baseUrl/myData/lifestyle',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RequestCategoryMetadataCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request category metadata',
      apiUrl: '$baseUrl/schema/categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? parent(dynamic response) => (getJsonField(
        response,
        r'''$[:].parent''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? comment(dynamic response) => (getJsonField(
        response,
        r'''$[:].comment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? order(dynamic response) => (getJsonField(
        response,
        r'''$[:].order''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RequestItemsMetadataCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request items metadata',
      apiUrl: '$baseUrl/schema/items',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? category(dynamic response) => (getJsonField(
        response,
        r'''$[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? co2eqPerUnit(dynamic response) => (getJsonField(
        response,
        r'''$[:].co2eqPerUnit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? ubpPerUnit(dynamic response) => getJsonField(
        response,
        r'''$[:].UbpPerUnit''',
        true,
      ) as List?;
  List? comment(dynamic response) => getJsonField(
        response,
        r'''$[:].comment''',
        true,
      ) as List?;
  List<int>? unitType(dynamic response) => (getJsonField(
        response,
        r'''$[:].unitType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RequestUnitsMetadataCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request units metadata',
      apiUrl: '$baseUrl/schema/units',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? numeric(dynamic response) => (getJsonField(
        response,
        r'''$[:].numeric''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RequestUnitOptionsMetadataCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request unitOptions metadata',
      apiUrl: '$baseUrl/schema/unitOptions',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? unit(dynamic response) => (getJsonField(
        response,
        r'''$[:].unit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? optionLabel(dynamic response) => (getJsonField(
        response,
        r'''$[:].optionLabel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? value(dynamic response) => (getJsonField(
        response,
        r'''$[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UserAuthorizationCall {
  Future<ApiCallResponse> call({
    String? loginType = '',
    String? userName = '',
    String? credentials = '',
  }) async {
    final baseUrl = MeAndMyPlanetMockAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User authorization',
      apiUrl: '$baseUrl/auth/$loginType/$userName/$credentials',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.JWT''',
      ));
}

/// End Me and My Planet (Mock) API Group Code

class GetAirportsCall {
  static Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    final ffApiRequestBody = '''
{
  "search": "${escapeStringForJson(search)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAirports',
      apiUrl: 'https://airports.p.rapidapi.com/v1/airports',
      callType: ApiCallType.POST,
      headers: {
        'X-RapidAPI-Key': 'bbb43914d3msh51450bb16d554d1p15c562jsnb83360c9db26',
        'Content-Type': 'application/json',
        'X-RapidAPI-Host': 'airports.p.rapidapi.com',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? iata(dynamic response) => (getJsonField(
        response,
        r'''$[:].iata''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? country(dynamic response) => (getJsonField(
        response,
        r'''$[:].country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$[:].city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? icao(dynamic response) => (getJsonField(
        response,
        r'''$[:].icao''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countryName(dynamic response) => (getJsonField(
        response,
        r'''$[:].country_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? elevation(dynamic response) => (getJsonField(
        response,
        r'''$[:].elevation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$[:].lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lon(dynamic response) => (getJsonField(
        response,
        r'''$[:].lon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? tz(dynamic response) => (getJsonField(
        response,
        r'''$[:].tz''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ac(dynamic response) => (getJsonField(
        response,
        r'''$[:].ac''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? an(dynamic response) => (getJsonField(
        response,
        r'''$[:].an''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cn(dynamic response) => (getJsonField(
        response,
        r'''$[:].cn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cc(dynamic response) => (getJsonField(
        response,
        r'''$[:].cc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ct(dynamic response) => (getJsonField(
        response,
        r'''$[:].ct''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
