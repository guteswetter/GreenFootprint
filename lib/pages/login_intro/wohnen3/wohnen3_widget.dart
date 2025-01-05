import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import 'wohnen3_model.dart';
export 'wohnen3_model.dart';

class Wohnen3Widget extends StatefulWidget {
  const Wohnen3Widget({super.key});

  @override
  State<Wohnen3Widget> createState() => _Wohnen3WidgetState();
}

class _Wohnen3WidgetState extends State<Wohnen3Widget> {
  late Wohnen3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Wohnen3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.dropDownValueController1?.value = FFAppState().Lifestyle.clothes;
      });
      safeSetState(() {
        _model.dropDownValueController2?.value =
            FFAppState().Lifestyle.entertainment;
      });
      safeSetState(() {
        _model.dropDownValueController3?.value =
            FFAppState().Lifestyle.furniture;
      });
      safeSetState(() {
        _model.dropDownValueController4?.value = FFAppState().Lifestyle.eatOut;
      });
      safeSetState(() {
        _model.dropDownValueController5?.value =
            FFAppState().Lifestyle.investments;
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
                  percent: 0.9,
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
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
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
                              'h2bhgbjy' /* Kategorie 3: Konsum */,
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
                              0.0, 0.0, 0.0, 15.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2zj1uml4' /* Wie hoch sind deine monatliche... */,
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
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'c094rzi5' /* Schuhe und Kleidung? */,
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
                          options: List<int>.from([0, 1, 2, 3, 4]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '6wvgbasu' /* Sehr tief (ca. 20 CHF oder wen... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r7efydzw' /* Tief (ca. 50 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              '55gab7uf' /* Durchschnitt (ca. 100 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              '3ayyzb2h' /* Hoch (ca. 125 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'avzcjmzv' /* Sehr hoch (ca. 250 CHF oder me... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue1 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..clothes = _model.dropDownValue1,
                            );
                            safeSetState(() {});
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
                            'krdup6ks' /* Bitte auswählen */,
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
                              'cdhqlevo' /* Hobbies, Freizeitaktivitäten u... */,
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
                          options: List<int>.from([0, 1, 2, 3, 4]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '2onecr8v' /* Sehr tief (50 CHF oder weniger... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'uizlnpgb' /* Tief (ca. 150 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              '7j5lm876' /* Durchschnitt (ca. 260 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'pqaf9zze' /* Hoch (ca. 400 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cpqdqvoz' /* Sehr hoch (ca. 600 CHF oder me... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue2 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..entertainment = _model.dropDownValue2,
                            );
                            safeSetState(() {});
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
                            '0zpynqlg' /* Bitte auswählen */,
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
                              'jzbpgi5q' /* Möbel und Haushaltsgeräte? */,
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
                          options: List<int>.from([0, 1, 2, 3, 4]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'exv18f9r' /* Sehr tief (25 CHF oder weniger... */,
                            ),
                            FFLocalizations.of(context).getText(
                              '77l7mod7' /* Tief (ca. 75 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hic3yhd2' /* Durchschnitt (ca. 125 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r0s4l8sw' /* Hoch (ca. 200 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jqlp8ubb' /* Sehr hoch (ca. 300 CHF oder me... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue3 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..furniture = _model.dropDownValue3,
                            );
                            safeSetState(() {});
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
                            'w66bog5b' /* Bitte auswählen */,
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
                              '3u2p811n' /* Auswertige Verpflegung? */,
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
                          options: List<int>.from([0, 1, 2, 3, 4]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '6aliignc' /* Sehr tief (50 CHF oder weniger... */,
                            ),
                            FFLocalizations.of(context).getText(
                              'e2oite57' /* Tief (ca. 100 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'orlk9gaq' /* Durchschnitt (ca. 250 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qrhs62s4' /* Hoch (ca. 400 CHF) */,
                            ),
                            FFLocalizations.of(context).getText(
                              'fy2y3o3l' /* Sehr hoch (ca. 600 CHF oder me... */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue4 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..eatOut = _model.dropDownValue4,
                            );
                            safeSetState(() {});
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
                            '5crhh238' /* Bitte auswählen */,
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
                              'cdnzhpv0' /* Welcher Anteil deiner Ersparni... */,
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
                          controller: _model.dropDownValueController5 ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1, 2, 3, 4]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '8za5xkik' /* Kein Anteil */,
                            ),
                            FFLocalizations.of(context).getText(
                              'w5nar7iz' /* Wenig */,
                            ),
                            FFLocalizations.of(context).getText(
                              'heo3qvrd' /* Viel */,
                            ),
                            FFLocalizations.of(context).getText(
                              '7xk4k4mk' /* Alles */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rw9gwh9s' /* Keine Ahnung */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue5 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..investments = _model.dropDownValue5,
                            );
                            safeSetState(() {});
                            FFAppState().InitialSetupDone = true;
                            safeSetState(() {});
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
                            '7vhaa4cj' /* Bitte auswählen */,
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
                          await MeAndMyPlanetMockAPIGroup
                              .saveNewLifestyleSettingsForUserCall
                              .call(
                            bearerAuth: currentAuthenticationToken,
                            houseType: FFAppState().Lifestyle.houseType,
                            heatingType: FFAppState().Lifestyle.heatingType,
                            houseAge: FFAppState().Lifestyle.houseAge,
                            temp: FFAppState().Lifestyle.temp,
                            area: FFAppState().Lifestyle.area,
                            persons: FFAppState().Lifestyle.persons,
                            warmWaterType: FFAppState().Lifestyle.warmWaterType,
                            efficiency: FFAppState().Lifestyle.efficiency,
                            fridge: FFAppState().Lifestyle.fridge,
                            washing: FFAppState().Lifestyle.washing,
                            drying: FFAppState().Lifestyle.drying,
                            eco: FFAppState().Lifestyle.eco,
                            clothes: FFAppState().Lifestyle.clothes,
                            entertainment: FFAppState().Lifestyle.entertainment,
                            furniture: FFAppState().Lifestyle.furniture,
                            eatOut: FFAppState().Lifestyle.eatOut,
                            investments: FFAppState().Lifestyle.investments,
                          );

                          context.pushNamed('WohnenAuswertung');
                        },
                        text: FFLocalizations.of(context).getText(
                          'gzaqn74k' /* Abschliessen */,
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
