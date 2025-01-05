import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'username_email_model.dart';
export 'username_email_model.dart';

class UsernameEmailWidget extends StatefulWidget {
  const UsernameEmailWidget({super.key});

  @override
  State<UsernameEmailWidget> createState() => _UsernameEmailWidgetState();
}

class _UsernameEmailWidgetState extends State<UsernameEmailWidget> {
  late UsernameEmailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsernameEmailModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 15.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            const Duration(milliseconds: 2000),
            () => safeSetState(() {}),
          ),
          onFieldSubmitted: (_) async {
            _model.email = _model.email;
          },
          autofocus: false,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelText: FFLocalizations.of(context).getText(
              '2nlh9k42' /* E-Mail */,
            ),
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
            hintText: FFLocalizations.of(context).getText(
              'x6trc2ef' /* max.muster@gmail.com */,
            ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
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
            suffixIcon: _model.textController!.text.isNotEmpty
                ? InkWell(
                    onTap: () async {
                      _model.textController?.clear();
                      safeSetState(() {});
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 24.0,
                    ),
                  )
                : null,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                letterSpacing: 0.0,
              ),
          keyboardType: TextInputType.emailAddress,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
