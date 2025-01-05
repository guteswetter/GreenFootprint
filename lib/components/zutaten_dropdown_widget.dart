import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zutaten_dropdown_model.dart';
export 'zutaten_dropdown_model.dart';

class ZutatenDropdownWidget extends StatefulWidget {
  const ZutatenDropdownWidget({super.key});

  @override
  State<ZutatenDropdownWidget> createState() => _ZutatenDropdownWidgetState();
}

class _ZutatenDropdownWidgetState extends State<ZutatenDropdownWidget> {
  late ZutatenDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZutatenDropdownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      multiSelectController: _model.dropDownValueController ??=
          FormListFieldController<String>(null),
      options: FFAppState().ZutatenListe.map((e) => e.name).toList(),
      width: 375.0,
      height: 40.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Montserrat',
            letterSpacing: 0.0,
          ),
      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Montserrat',
            letterSpacing: 0.0,
          ),
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Montserrat',
            letterSpacing: 0.0,
          ),
      hintText: FFLocalizations.of(context).getText(
        't605a8le' /* Zutaten auswählen... */,
      ),
      searchHintText: FFLocalizations.of(context).getText(
        '5xfmxku9' /* Search... */,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: true,
      isMultiSelect: true,
      onMultiSelectChanged: (val) =>
          safeSetState(() => _model.dropDownValue = val),
    );
  }
}
