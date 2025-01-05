import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'wohnen_bearbeiten_widget.dart' show WohnenBearbeitenWidget;
import 'package:flutter/material.dart';

class WohnenBearbeitenModel extends FlutterFlowModel<WohnenBearbeitenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get lifestyle settings for user)] action in WohnenBearbeiten widget.
  ApiCallResponse? getLifestyleSettings;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // State field(s) for DropDown widget.
  int? dropDownValue3;
  FormFieldController<int>? dropDownValueController3;
  // State field(s) for DropDown widget.
  int? dropDownValue4;
  FormFieldController<int>? dropDownValueController4;
  // State field(s) for DropDown widget.
  int? dropDownValue5;
  FormFieldController<int>? dropDownValueController5;
  // State field(s) for DropDown widget.
  int? dropDownValue6;
  FormFieldController<int>? dropDownValueController6;
  // State field(s) for DropDown widget.
  int? dropDownValue7;
  FormFieldController<int>? dropDownValueController7;
  // State field(s) for DropDown widget.
  int? dropDownValue8;
  FormFieldController<int>? dropDownValueController8;
  // State field(s) for DropDown widget.
  int? dropDownValue9;
  FormFieldController<int>? dropDownValueController9;
  // State field(s) for DropDown widget.
  int? dropDownValue10;
  FormFieldController<int>? dropDownValueController10;
  // State field(s) for DropDown widget.
  int? dropDownValue11;
  FormFieldController<int>? dropDownValueController11;
  // State field(s) for DropDown widget.
  int? dropDownValue12;
  FormFieldController<int>? dropDownValueController12;
  // State field(s) for DropDown widget.
  int? dropDownValue13;
  FormFieldController<int>? dropDownValueController13;
  // State field(s) for DropDown widget.
  int? dropDownValue14;
  FormFieldController<int>? dropDownValueController14;
  // State field(s) for DropDown widget.
  int? dropDownValue15;
  FormFieldController<int>? dropDownValueController15;
  // State field(s) for DropDown widget.
  int? dropDownValue16;
  FormFieldController<int>? dropDownValueController16;
  // State field(s) for DropDown widget.
  int? dropDownValue17;
  FormFieldController<int>? dropDownValueController17;
  // Stores action output result for [Backend Call - API (Save new lifestyle settings for user)] action in Button widget.
  ApiCallResponse? aPICallStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
