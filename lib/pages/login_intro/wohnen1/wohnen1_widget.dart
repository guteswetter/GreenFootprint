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
import 'wohnen1_model.dart';
export 'wohnen1_model.dart';

class Wohnen1Widget extends StatefulWidget {
  const Wohnen1Widget({super.key});

  @override
  State<Wohnen1Widget> createState() => _Wohnen1WidgetState();
}

class _Wohnen1WidgetState extends State<Wohnen1Widget> {
  late Wohnen1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Wohnen1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getLifestyleSettings =
          await MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall.call(
        bearerAuth: currentAuthenticationToken,
      );

      if ((_model.getLifestyleSettings?.succeeded ?? true)) {
        FFAppState().updateLifestyleStruct(
          (e) => e
            ..houseType = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .houseType(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..heatingType = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .heatingType(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..houseAge = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .houseAge(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..temp =
                MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall.temp(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..area =
                MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall.area(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..persons =
                MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall.area(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..warmWaterType = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .warmWaterType(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..efficiency = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .efficiency(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..fridge = MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall
                .fridge(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..washing = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .washing(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..drying = MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall
                .drying(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..eco =
                MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall.eco(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..clothes = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .clothes(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..entertainment = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .entertainment(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..furniture = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .furniture(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..eatOut = MeAndMyPlanetMockAPIGroup.getLifestyleSettingsForUserCall
                .eatOut(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            )
            ..investments = MeAndMyPlanetMockAPIGroup
                .getLifestyleSettingsForUserCall
                .investments(
              (_model.getLifestyleSettings?.jsonBody ?? ''),
            ),
        );
        safeSetState(() {});
      }
      safeSetState(() {
        _model.dropDownValueController1?.value =
            FFAppState().Lifestyle.houseType;
      });
      safeSetState(() {
        _model.dropDownValueController2?.value =
            FFAppState().Lifestyle.heatingType;
      });
      safeSetState(() {
        _model.dropDownValueController3?.value =
            FFAppState().Lifestyle.houseAge;
      });
      safeSetState(() {
        _model.dropDownValueController4?.value = FFAppState().Lifestyle.temp;
      });
      safeSetState(() {
        _model.dropDownValueController5?.value = FFAppState().Lifestyle.area;
      });
      safeSetState(() {
        _model.dropDownValueController6?.value = FFAppState().Lifestyle.persons;
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
                  percent: 0.3,
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
                              'ocn8h9uu' /* Kategorie 1: Wohnen */,
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
                              'rdf727wu' /* In welchem Typ Haus wohnst du? */,
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
                          options: List<int>.from([0, 1]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              's87sfgc2' /* Einfamilienhaus */,
                            ),
                            FFLocalizations.of(context).getText(
                              '8nvsmzc5' /* Mehrfamilienhaus */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue1 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..houseType = _model.dropDownValue1,
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
                            '128outke' /* Bitte auswählen */,
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
                              'iqh0y5r2' /* Wie heizt du dein Zuhause? */,
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
                          options: List<int>.from([0, 1, 2, 3, 4, 5, 6, 7, 8]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'ydm4i4i2' /* Ölheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4r5afmex' /* Ölheizung mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              'fsewm7i3' /* Gasheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              'sp2w3p2k' /* Gasheizung mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ahm51rfe' /* Fernwärme */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nhliiu18' /* Elektroheizung */,
                            ),
                            FFLocalizations.of(context).getText(
                              'g6knvh08' /* Wärmepumpe */,
                            ),
                            FFLocalizations.of(context).getText(
                              'zk3p7gb1' /* Holz mit Solarpanels */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ceypnvpe' /* Holz (Pellets, Scheite) */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue2 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..heatingType = _model.dropDownValue2,
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
                            '6rvsy0xk' /* Bitte auswählen */,
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
                              'wcqu8gs5' /* Baujahr oder Minergie-Standard */,
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
                          options: List<int>.from([0, 1, 2, 3, 4, 5, 6]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              '7w9vzsz1' /* Vor 1980 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ezctyjf8' /* 1980 - 1990 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5icmlxtl' /* 1991 - 2008 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2d0aihvz' /* Nach 1980 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'tyya15gg' /* Minergie */,
                            ),
                            FFLocalizations.of(context).getText(
                              'tt1wncc8' /* Minergie-A */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ass74h7i' /* Minergie-P */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue3 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..houseAge = _model.dropDownValue3,
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
                            'v2jnqudh' /* Bitte auswählen */,
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
                              'lplh7w22' /* Durchschnittliche Raumtemperat... */,
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
                          options: List<int>.from([0, 1, 2, 3]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'a9wwee0q' /* <= 17 °C */,
                            ),
                            FFLocalizations.of(context).getText(
                              'plm6q5ry' /* 18 - 19 °C */,
                            ),
                            FFLocalizations.of(context).getText(
                              'esmcwa6w' /* 20 - 22 °C */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1ba93cwt' /* > 22 °C */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue4 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..temp = _model.dropDownValue4,
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
                            'u0pr18vg' /* Bitte auswählen */,
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
                              'npok4li1' /* Beheizte Fläche */,
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
                          options: List<int>.from([0, 1, 2, 3, 4, 5, 6, 7, 8]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'vznedj4n' /* > 30 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '0dekrds5' /* 30 - 50 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qt9begpw' /* 51 - 75 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'whxis3tq' /* 76 - 100 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'usd1r5z2' /* 101 - 125 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '24tdgm2t' /* 126 - 150 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'p03m0yvy' /* 151 - 200 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ydb3dpod' /* 201 - 300 m2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ocnf9hso' /* > 300 m2 */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue5 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..area = _model.dropDownValue5,
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
                            'h4onuvmw' /* Bitte auswählen */,
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
                              'cz6cmzgl' /* Wie viele Personen wohnen in d... */,
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
                          options: List<int>.from([0, 1, 2, 3, 4, 5, 6]),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'auw3262c' /* 1 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b9dpt9df' /* 2 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'va091wg4' /* 3 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rwet2f0t' /* 4 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4364epa5' /* 5 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'z8fhk2p2' /* 6 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '62j2z4by' /* 7 (oder mehr) */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue6 = val);
                            FFAppState().updateLifestyleStruct(
                              (e) => e..persons = _model.dropDownValue6,
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
                            'olducrij' /* Bitte auswählen */,
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
                          context.pushNamed('Wohnen2');
                        },
                        text: FFLocalizations.of(context).getText(
                          'ncj0z7vg' /* Weiter */,
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
