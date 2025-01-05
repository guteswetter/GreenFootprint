import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  double? nutritionDaily = 0.0;

  double? nutritionWeekly = 0.0;

  double weeks = 52.0;

  double days = 365.0;

  int currentDate = 0;

  int currentItem = 0;

  int totalDates = 0;

  int totalItems = 0;

  double? transportationDaily = 0.0;

  double? transportationWeekly = 0.0;

  double? housingWeekly = 0.0;

  double? housingDaily = 0.0;

  List<double> totalCO2List = [];
  void addToTotalCO2List(double item) => totalCO2List.add(item);
  void removeFromTotalCO2List(double item) => totalCO2List.remove(item);
  void removeAtIndexFromTotalCO2List(int index) => totalCO2List.removeAt(index);
  void insertAtIndexInTotalCO2List(int index, double item) =>
      totalCO2List.insert(index, item);
  void updateTotalCO2ListAtIndex(int index, Function(double) updateFn) =>
      totalCO2List[index] = updateFn(totalCO2List[index]);

  double? flightEmissionsDaily;

  bool isDataLoaded = false;

  bool dailyIsEmpty = true;

  double? dailyMenge = 0.0;

  bool weekyIsEmpty = true;

  double? weeklyMenge = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get lifestyle emissions for user)] action in Dashboard widget.
  ApiCallResponse? getHousingEmissions;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT0;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT1;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT2;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT3;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT4;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT5;
  // Stores action output result for [Backend Call - API (Request user data of a certain category by date)] action in Dashboard widget.
  ApiCallResponse? getItemsT6;
  // Stores action output result for [Backend Call - API (List all flights for this user)] action in Dashboard widget.
  ApiCallResponse? getFlightData;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
