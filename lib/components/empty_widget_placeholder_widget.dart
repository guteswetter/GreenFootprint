import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_widget_placeholder_model.dart';
export 'empty_widget_placeholder_model.dart';

class EmptyWidgetPlaceholderWidget extends StatefulWidget {
  const EmptyWidgetPlaceholderWidget({super.key});

  @override
  State<EmptyWidgetPlaceholderWidget> createState() =>
      _EmptyWidgetPlaceholderWidgetState();
}

class _EmptyWidgetPlaceholderWidgetState
    extends State<EmptyWidgetPlaceholderWidget> {
  late EmptyWidgetPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyWidgetPlaceholderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349.0,
      height: 41.0,
      decoration: const BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'zl9a5x8f' /* Keine Einträge vorhanden */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
