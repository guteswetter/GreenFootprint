import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'mahlzeit_zutaten_auswaehlen_widget.dart'
    show MahlzeitZutatenAuswaehlenWidget;
import 'package:flutter/material.dart';

class MahlzeitZutatenAuswaehlenModel
    extends FlutterFlowModel<MahlzeitZutatenAuswaehlenWidget> {
  ///  Local state fields for this page.

  int mahlzeitID = 0;

  bool mahlzeitVollstaendig = false;

  int current = 0;

  int? totalItems = 0;

  int? entryID;

  double? mengeNeu;

  int? zutatAusgewaehlt;

  bool editMode = false;

  int unit = 0;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for DatumTextField widget.
  FocusNode? datumTextFieldFocusNode;
  TextEditingController? datumTextFieldTextController;
  String? Function(BuildContext, String?)?
      datumTextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for MengeTextField widget.
  FocusNode? mengeTextFieldFocusNode;
  TextEditingController? mengeTextFieldTextController;
  String? Function(BuildContext, String?)?
      mengeTextFieldTextControllerValidator;
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

    mengeTextFieldFocusNode?.dispose();
    mengeTextFieldTextController?.dispose();
  }
}
