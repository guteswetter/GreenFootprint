import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reise_bearbeiten_widget.dart' show ReiseBearbeitenWidget;
import 'package:flutter/material.dart';

class ReiseBearbeitenModel extends FlutterFlowModel<ReiseBearbeitenWidget> {
  ///  Local state fields for this page.

  int? id;

  double? co2eqPerUnit = 0.0;

  double? co2eq = 0.0;

  double? empty = 0.0;

  bool editMode = true;

  double? mengeNeu = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Request items metadata)] action in ReiseBearbeiten widget.
  ApiCallResponse? getTransportData;
  // Stores action output result for [Backend Call - API (Edit existing data in database by entry ID)] action in IconButton widget.
  ApiCallResponse? deleteEntry;
  // State field(s) for DatumTextField widget.
  FocusNode? datumTextFieldFocusNode;
  TextEditingController? datumTextFieldTextController;
  String? Function(BuildContext, String?)?
      datumTextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Edit existing data in database by entry ID)] action in Button widget.
  ApiCallResponse? editEntry;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    datumTextFieldFocusNode?.dispose();
    datumTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
