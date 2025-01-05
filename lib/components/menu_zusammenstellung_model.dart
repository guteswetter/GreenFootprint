import '/flutter_flow/flutter_flow_util.dart';
import 'menu_zusammenstellung_widget.dart' show MenuZusammenstellungWidget;
import 'package:flutter/material.dart';

class MenuZusammenstellungModel
    extends FlutterFlowModel<MenuZusammenstellungWidget> {
  ///  Local state fields for this component.

  String? name;

  double? menge;

  String? unit;

  int? id;

  double? co2eq;

  double? co2eqCalculated = 0.0;

  double? co2Total = 0.0;

  int? mahlzeitId;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
