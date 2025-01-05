import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'wohnen2_model.dart';
export 'wohnen2_model.dart';

class Wohnen2Widget extends StatefulWidget {
  const Wohnen2Widget({super.key});

  @override
  State<Wohnen2Widget> createState() => _Wohnen2WidgetState();
}

class _Wohnen2WidgetState extends State<Wohnen2Widget> {
  late Wohnen2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Wohnen2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.dropDownValueController1?.value =
            FFAppState().Lifestyle.warmWaterType;
      });
      safeSetState(() {
        _model.dropDownValueController2?.value =
            FFAppState().Lifestyle.efficiency;
      });
      safeSetState(() {
        _model.dropDownValueController3?.value = FFAppState().Lifestyle.fridge;
      });
      safeSetState(() {
        _model.dropDownValueController4?.value = FFAppState().Lifestyle.washing;
      });
      safeSetState(() {
        _model.dropDownValueController5?.value = FFAppState().Lifestyle.drying;
      });
      safeSetState(() {
        _model.dropDownValueController6?.value = FFAppState().Lifestyle.eco;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: LinearPercentIndicator(
                  percent: 0.6,
                  lineHeight: 10.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).primary,
                  backgroundColor: FlutterFlowTheme.of(context).accent4,
                  padding: EdgeInsets.zero,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 20.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'a234fh5h' /* Kategorie 2: Energie */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'p19oq3qc' /* Wie wird dein Wasser geheizt? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController1 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2, 3, 4, 5, 6, 7, 8]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'jk4ikq16' /* Ölheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              '62tuajuz' /* Ölheizung mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              '3qsb623z' /* Gasheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qkm6ltzb' /* Gasheizung mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              'd3fep1zb' /* Fernwärme */,
                            ),
                            FFLocalizations.of(context).getText(
                              'khz1p22x' /* Elektroheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              'g9hvkzaz' /* Wärmepumpe */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5kx4i3vt' /* Holz mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              't0gf8oen' /* Holz (Pellets, Scheite) */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue1 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..warmWaterType = _model.dropDownValue1,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            't1ur5osv' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'aaum2l8o' /* Welche (durchschnittliche) Ene... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2, 3, 4, 5]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '9kg19lry' /* Schlechter als A */,
                            ),
                            FFLocalizations.of(context).getText(
                              'lbqsdsb0' /* A */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ay1gssbm' /* A+ */,
                            ),
                            FFLocalizations.of(context).getText(
                              'd6tq9ujf' /* A++ */,
                            ),
                            FFLocalizations.of(context).getText(
                              'k21g6s81' /* Keine Ahnung - die meisten Ger... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ziw04lqg' /* Keine Ahnung - die meisten Ger... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue2 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..efficiency = _model.dropDownValue2,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '7ypedy6c' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2tyu754q' /* Welche Kühlgeräte nutzt  du? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController3 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2, 3]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'lifhwk0o' /* Kühlschrank mit Gefrierfach */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ctxaj9zp' /* Kühlschrank/Tiefkühlerkombinat... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'lpjtmger' /* Kühlschrank mit Gefierfach und... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cii8xolk' /* Mehrere Kühlschränke und/oder ... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue3 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..fridge = _model.dropDownValue3,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'kjybyhv2' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cktilbdh' /* Wie wäschst du deine Wäsche? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController4 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'yjfz5xpf' /* Über die Hälfte 30 °C und weni... */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2cw34qdp' /* Den grössten Teil 40 °C, ca. 1... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hdqyqyc0' /* Gemäss Herstellerangabe, geleg... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue4 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..washing = _model.dropDownValue4,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'ba7n2xbq' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'iya8srmb' /* Wie trocknest du deine Wäsche? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController5 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'c836p14u' /* Wäscheleine */,
                            ),
                            FFLocalizations.of(context).getText(
                              'kh2og6qb' /* Teils im Tumbler / teils an de... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vbfjlfvp' /* Nur im Tumbler */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue5 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..drying = _model.dropDownValue5,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '9t06ruae' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2i01ap0n' /* Welcher Anteil deines Stroms l... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController6 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'zwrosfa3' /* Kein Anteil */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ifgfobd2' /* Ein Teil davon */,
                            ),
                            FFLocalizations.of(context).getText(
                              'p05eybg9' /* Alles */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue6 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..eco = _model.dropDownValue6,
                            );
                          },
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'tuo9hfxq' /* Bitte auswählen */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Wohnen3');
                        },
                        text: FFLocalizations.of(context).getText(
                          'goe244bm' /* Weiter */,
                        ),
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
