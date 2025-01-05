import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'component_switch_model.dart';
export 'component_switch_model.dart';

class ComponentSwitchWidget extends StatefulWidget {
  const ComponentSwitchWidget({super.key});

  @override
  State<ComponentSwitchWidget> createState() => _ComponentSwitchWidgetState();
}

class _ComponentSwitchWidgetState extends State<ComponentSwitchWidget> {
  late ComponentSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentSwitchModel());

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue);
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: const Color(0xFFB5D8D1),
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
