import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'password_model.dart';
export 'password_model.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late PasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onFieldSubmitted: (_) async {
            _model.password = _model.password;
          },
          autofocus: false,
          textInputAction: TextInputAction.go,
          obscureText: !_model.passwordVisibility,
          decoration: InputDecoration(
            isDense: true,
            labelText: FFLocalizations.of(context).getText(
              '2fuk5efi' /* Passwort */,
            ),
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
            hintText: FFLocalizations.of(context).getText(
              'wpeyodp7' /* ******************** */,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            suffixIcon: InkWell(
              onTap: () => safeSetState(
                () => _model.passwordVisibility = !_model.passwordVisibility,
              ),
              focusNode: FocusNode(skipTraversal: true),
              child: Icon(
                _model.passwordVisibility
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: FlutterFlowTheme.of(context).secondary,
                size: 24.0,
              ),
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                letterSpacing: 0.0,
              ),
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
