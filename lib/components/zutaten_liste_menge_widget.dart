import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zutaten_liste_menge_model.dart';
export 'zutaten_liste_menge_model.dart';

class ZutatenListeMengeWidget extends StatefulWidget {
  const ZutatenListeMengeWidget({
    super.key,
    this.mahlzeitID,
    this.itemID,
    this.unitType,
    this.index,
    this.date,
    this.menge,
    bool? editMode,
    this.co2eqPerUnit,
  }) : editMode = editMode ?? false;

  final int? mahlzeitID;
  final int? itemID;
  final int? unitType;
  final int? index;
  final String? date;
  final double? menge;
  final bool editMode;
  final double? co2eqPerUnit;

  @override
  State<ZutatenListeMengeWidget> createState() =>
      _ZutatenListeMengeWidgetState();
}

class _ZutatenListeMengeWidgetState extends State<ZutatenListeMengeWidget> {
  late ZutatenListeMengeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZutatenListeMengeModel());

    _model.textController ??= TextEditingController(
        text: FFAppState()
            .MahlzeitEinzeln
            .where((e) => e.itemID == widget.itemID)
            .toList()
            .firstOrNull
            ?.menge
            .toString());
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: widget.editMode == false
            ? FlutterFlowTheme.of(context).accent4
            : FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  FFAppState()
                      .ZutatenListe
                      .where((e) => e.id == widget.itemID)
                      .toList()
                      .firstOrNull
                      ?.name,
                  'Zutat nicht vorhanden',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: SizedBox(
                width: 60.0,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    const Duration(milliseconds: 2000),
                    () async {
                      FFAppState().updateMahlzeitEinzelnAtIndex(
                        widget.index!,
                        (e) => e
                          ..menge = double.tryParse(_model.textController.text),
                      );
                      FFAppState().updateMahlzeitEinzelnAtIndex(
                        widget.index!,
                        (e) => e
                          ..co2 = valueOrDefault<double>(
                            double.parse(_model.textController.text) *
                                FFAppState()
                                    .ZutatenListe
                                    .where((e) => e.id == widget.itemID)
                                    .toList()
                                    .firstOrNull!
                                    .co2eqPerUnit,
                            0.0,
                          ),
                      );
                      FFAppState().update(() {});
                    },
                  ),
                  autofocus: false,
                  readOnly: widget.editMode == false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: FFLocalizations.of(context).getText(
                      'e67hdowf' /* 0 */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    filled: true,
                    fillColor: widget.editMode == false
                        ? FlutterFlowTheme.of(context).alternate
                        : FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
          ),
          Text(
            valueOrDefault<String>(
              FFAppState()
                  .Units
                  .where((e) => e.id == widget.unitType)
                  .toList()
                  .firstOrNull
                  ?.name,
              'kg',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.delete,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              FFAppState().removeAtIndexFromMahlzeitEinzeln(widget.index!);
              FFAppState().removeAtIndexFromCo2Total(widget.index!);
              FFAppState().update(() {});
              _model.removeFromCo2eqTotal(
                  FFAppState().co2Total.elementAtOrNull(widget.index!)!);
              safeSetState(() {});
            },
          ),
        ],
      ),
    );
  }
}
