import '/components/zutat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'zutaten_liste_widget.dart' show ZutatenListeWidget;
import 'package:flutter/material.dart';

class ZutatenListeModel extends FlutterFlowModel<ZutatenListeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for zutat component.
  late ZutatModel zutatModel;

  @override
  void initState(BuildContext context) {
    zutatModel = createModel(context, () => ZutatModel());
  }

  @override
  void dispose() {
    zutatModel.dispose();
  }
}
