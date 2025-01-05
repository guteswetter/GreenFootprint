import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'zutaten_auswahlliste_model.dart';
export 'zutaten_auswahlliste_model.dart';

class ZutatenAuswahllisteWidget extends StatefulWidget {
  const ZutatenAuswahllisteWidget({
    super.key,
    required this.zutatenGesamt,
    int? selectedZutatID,
    required this.selectedZutatAction,
  }) : selectedZutatID = selectedZutatID ?? 0;

  final ZutatenSchemaStruct? zutatenGesamt;
  final int selectedZutatID;
  final Future Function(int zutatID)? selectedZutatAction;

  @override
  State<ZutatenAuswahllisteWidget> createState() =>
      _ZutatenAuswahllisteWidgetState();
}

class _ZutatenAuswahllisteWidgetState extends State<ZutatenAuswahllisteWidget> {
  late ZutatenAuswahllisteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZutatenAuswahllisteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
      child: FlutterFlowDropDown<String>(
        multiSelectController: _model.dropDownValueController ??=
            FormListFieldController<String>(null),
        options: [
          FFLocalizations.of(context).getText(
            'y9vizgj0' /* Option 1 */,
          ),
          FFLocalizations.of(context).getText(
            'uuh00pf8' /* Option 2 */,
          ),
          FFLocalizations.of(context).getText(
            '29cvmzgr' /* Option 3 */,
          )
        ],
        width: double.infinity,
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
          'o7sw77yk' /* Zutaten auswählen... */,
        ),
        searchHintText: FFLocalizations.of(context).getText(
          'vp9zjalg' /* Suchen... */,
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
      ),
    );
  }
}
