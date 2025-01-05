import '/backend/api_requests/api_calls.dart';
import '/components/password_widget.dart';
import '/components/username_email_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  int? current = 0;

  int? totalItems = 0;

  List<int> deleteByIndexList = [];
  void addToDeleteByIndexList(int item) => deleteByIndexList.add(item);
  void removeFromDeleteByIndexList(int item) => deleteByIndexList.remove(item);
  void removeAtIndexFromDeleteByIndexList(int index) =>
      deleteByIndexList.removeAt(index);
  void insertAtIndexInDeleteByIndexList(int index, int item) =>
      deleteByIndexList.insert(index, item);
  void updateDeleteByIndexListAtIndex(int index, Function(int) updateFn) =>
      deleteByIndexList[index] = updateFn(deleteByIndexList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for UsernameEmail component.
  late UsernameEmailModel usernameEmailModel;
  // Model for Password component.
  late PasswordModel passwordModel;
  // Stores action output result for [Backend Call - API (User authorization)] action in Button widget.
  ApiCallResponse? authResponse;
  // Stores action output result for [Backend Call - API (Request information about the group the user is part of)] action in Button widget.
  ApiCallResponse? groupInfo;
  // Stores action output result for [Backend Call - API (Request unitOptions metadata)] action in Button widget.
  ApiCallResponse? getUnitMetadata;

  @override
  void initState(BuildContext context) {
    usernameEmailModel = createModel(context, () => UsernameEmailModel());
    passwordModel = createModel(context, () => PasswordModel());
  }

  @override
  void dispose() {
    usernameEmailModel.dispose();
    passwordModel.dispose();
  }
}
