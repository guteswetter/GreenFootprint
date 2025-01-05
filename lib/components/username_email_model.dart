import '/flutter_flow/flutter_flow_util.dart';
import 'username_email_widget.dart' show UsernameEmailWidget;
import 'package:flutter/material.dart';

class UsernameEmailModel extends FlutterFlowModel<UsernameEmailWidget> {
  ///  Local state fields for this component.

  String email = 'max.muster@gmail.com';

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
