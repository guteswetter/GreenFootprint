import '/flutter_flow/flutter_flow_util.dart';
import 'zutaten_liste_menge_widget.dart' show ZutatenListeMengeWidget;
import 'package:flutter/material.dart';

class ZutatenListeMengeModel extends FlutterFlowModel<ZutatenListeMengeWidget> {
  ///  Local state fields for this component.

  List<double> co2eqTotal = [];
  void addToCo2eqTotal(double item) => co2eqTotal.add(item);
  void removeFromCo2eqTotal(double item) => co2eqTotal.remove(item);
  void removeAtIndexFromCo2eqTotal(int index) => co2eqTotal.removeAt(index);
  void insertAtIndexInCo2eqTotal(int index, double item) =>
      co2eqTotal.insert(index, item);
  void updateCo2eqTotalAtIndex(int index, Function(double) updateFn) =>
      co2eqTotal[index] = updateFn(co2eqTotal[index]);

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
