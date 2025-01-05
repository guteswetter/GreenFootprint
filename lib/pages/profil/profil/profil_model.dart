import '/components/dark_light_switch_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_widget.dart' show ProfilWidget;
import 'package:flutter/material.dart';

class ProfilModel extends FlutterFlowModel<ProfilWidget> {
  ///  Local state fields for this page.

  bool modusEdit = false;

  bool gruppeninfosAusgeklappt = false;

  ///  State fields for stateful widgets in this page.

  // Model for DarkLightSwitchSmall component.
  late DarkLightSwitchSmallModel darkLightSwitchSmallModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    darkLightSwitchSmallModel =
        createModel(context, () => DarkLightSwitchSmallModel());
  }

  @override
  void dispose() {
    darkLightSwitchSmallModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
