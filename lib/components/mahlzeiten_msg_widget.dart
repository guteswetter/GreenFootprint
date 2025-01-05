import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mahlzeiten_msg_model.dart';
export 'mahlzeiten_msg_model.dart';

class MahlzeitenMsgWidget extends StatefulWidget {
  const MahlzeitenMsgWidget({super.key});

  @override
  State<MahlzeitenMsgWidget> createState() => _MahlzeitenMsgWidgetState();
}

class _MahlzeitenMsgWidgetState extends State<MahlzeitenMsgWidget> {
  late MahlzeitenMsgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MahlzeitenMsgModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 73.0,
      decoration: const BoxDecoration(),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'd0wf158h' /* Du hast noch keine Mahlzeiten ... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
