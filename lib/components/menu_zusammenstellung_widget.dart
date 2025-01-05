import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_zusammenstellung_model.dart';
export 'menu_zusammenstellung_model.dart';

class MenuZusammenstellungWidget extends StatefulWidget {
  const MenuZusammenstellungWidget({
    super.key,
    this.zutatId,
    double? co2Total,
    this.mahlzeitDatum,
    double? menge,
    this.entryID,
    this.mahlzeitID,
    this.index,
  })  : co2Total = co2Total ?? 0.0,
        menge = menge ?? 0.0;

  final int? zutatId;
  final double co2Total;
  final String? mahlzeitDatum;
  final double menge;
  final int? entryID;
  final int? mahlzeitID;
  final int? index;

  @override
  State<MenuZusammenstellungWidget> createState() =>
      _MenuZusammenstellungWidgetState();
}

class _MenuZusammenstellungWidgetState
    extends State<MenuZusammenstellungWidget> {
  late MenuZusammenstellungModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuZusammenstellungModel());

    _model.textController ??=
        TextEditingController(text: widget.menge.toString());
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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 49.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFAppState()
                          .ZutatenListe
                          .where((e) => widget.zutatId == e.id)
                          .toList()
                          .firstOrNull!
                          .name,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
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
                              ..menge =
                                  double.tryParse(_model.textController.text),
                          );
                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'j0hu4xuz' /* 0 */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                            lineHeight: 2.0,
                          ),
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.unit,
                    'Menge',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                        lineHeight: 1.0,
                      ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.delete_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    FFAppState()
                        .removeAtIndexFromMahlzeitEinzeln(widget.index!);
                    safeSetState(() {});
                  },
                ),
              ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
