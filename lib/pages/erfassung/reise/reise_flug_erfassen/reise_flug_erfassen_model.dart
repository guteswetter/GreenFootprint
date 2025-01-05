import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reise_flug_erfassen_widget.dart' show ReiseFlugErfassenWidget;
import 'package:flutter/material.dart';

class ReiseFlugErfassenModel extends FlutterFlowModel<ReiseFlugErfassenWidget> {
  ///  Local state fields for this page.

  bool firstDropdown = false;

  bool secondDropdown = false;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - countChars] action in TextField widget.
  int? countChar;
  // Stores action output result for [Backend Call - API (GetAirports)] action in TextField widget.
  ApiCallResponse? getDepartureAirports;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - countChars] action in TextField widget.
  int? countCharTF2;
  // Stores action output result for [Backend Call - API (GetAirports)] action in TextField widget.
  ApiCallResponse? getDestinationAirports;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Add flight to database)] action in Button widget.
  ApiCallResponse? flightID;
  // Stores action output result for [Backend Call - API (Add flight to database)] action in Button widget.
  ApiCallResponse? flightID2;
  // Stores action output result for [Backend Call - API (Add flight to database)] action in Button widget.
  ApiCallResponse? flightID3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
