import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reise_erfassen_widget.dart' show ReiseErfassenWidget;
import 'package:flutter/material.dart';

class ReiseErfassenModel extends FlutterFlowModel<ReiseErfassenWidget> {
  ///  Local state fields for this page.

  int? id;

  double? co2eqPerUnit = 0.0;

  double? co2eq = 0.0;

  int? current = 0;

  int? totalItems = 0;

  int? entryID = 0;

  double? mengeNeu = 0.0;

  int? reiseID = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Request items metadata)] action in ReiseErfassen widget.
  ApiCallResponse? getTransportData;
  DateTime? datePicked;
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
  ApiCallResponse? updateByEntryID;
  // Stores action output result for [Backend Call - API (addDaily)] action in Button widget.
  ApiCallResponse? getEntryID;

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
