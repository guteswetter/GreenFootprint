import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'wohnen_bearbeiten_model.dart';
export 'wohnen_bearbeiten_model.dart';

class WohnenBearbeitenWidget extends StatefulWidget {
  const WohnenBearbeitenWidget({super.key});

  @override
  State<WohnenBearbeitenWidget> createState() => _WohnenBearbeitenWidgetState();
}

class _WohnenBearbeitenWidgetState extends State<WohnenBearbeitenWidget> {
  late WohnenBearbeitenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WohnenBearbeitenModel());

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
      safeSetState(() {
        _model.dropDownValueController7?.value =
            FFAppState().Lifestyle.warmWaterType;
      });
      safeSetState(() {
        _model.dropDownValueController8?.value =
            FFAppState().Lifestyle.efficiency;
      });
      safeSetState(() {
        _model.dropDownValueController9?.value = FFAppState().Lifestyle.fridge;
      });
      safeSetState(() {
        _model.dropDownValueController10?.value =
            FFAppState().Lifestyle.washing;
      });
      safeSetState(() {
        _model.dropDownValueController11?.value = FFAppState().Lifestyle.drying;
      });
      safeSetState(() {
        _model.dropDownValueController12?.value = FFAppState().Lifestyle.eco;
      });
      safeSetState(() {
        _model.dropDownValueController13?.value =
            FFAppState().Lifestyle.clothes;
      });
      safeSetState(() {
        _model.dropDownValueController14?.value =
            FFAppState().Lifestyle.entertainment;
      });
      safeSetState(() {
        _model.dropDownValueController15?.value =
            FFAppState().Lifestyle.furniture;
      });
      safeSetState(() {
        _model.dropDownValueController16?.value = FFAppState().Lifestyle.eatOut;
      });
      safeSetState(() {
        _model.dropDownValueController17?.value =
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 40.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Erfassen');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData(FFLocalizations.of(context).getText(
                          'qodul6eh' /* Wohnen */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          'gnu07rou' /* Energie */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          '28nqk608' /* Konsum */,
                        ))
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 12.0,
                      rowSpacing: 12.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.center,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [
                          FFLocalizations.of(context).getText(
                            'hzkils3g' /* Wohnen */,
                          )
                        ],
                      ),
                      wrapped: true,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.choiceChipsValue == 'Wohnen') {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 25.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'aw8paz6k' /* In welchem Typ Haus wohnst du? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        '60697aer' /* Einfamilienhaus */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        's33niv2d' /* Mehrfamilienhaus */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue1 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..houseType = _model.dropDownValue1,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'nie4hjfa' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'et410v4y' /* Wie heizt du dein Zuhause? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from(
                                        [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'w8a4aw87' /* Ölheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'v26lbr2q' /* Ölheizung mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '9fti01qe' /* Gasheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'pv4vmrbb' /* Gasheizung mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '2mye6630' /* Fernwärme */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '2jsw3oxi' /* Elektroheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'xt2fecv0' /* Wärmepumpe */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'xpficm4c' /* Holz mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '1nu4tieq' /* Holz (Pellets, Scheite) */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue2 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..heatingType = _model.dropDownValue2,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '30u4e7sn' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '8up4azm6' /* Baujahr oder Minergie-Standard */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController3 ??=
                                            FormFieldController<int>(null),
                                    options:
                                        List<int>.from([0, 1, 2, 3, 4, 5, 6]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'clqn34zf' /* Vor 1980 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6x3uithv' /* 1980 - 1990 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '036ylzs6' /* 1991 - 2008 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '3pkdss50' /* Nach 1980 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'zrmyzffy' /* Minergie */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'iitxgedr' /* Minergie-A */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '7793q73l' /* Minergie-P */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue3 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..houseAge = _model.dropDownValue3,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '6n5olkas' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '9vgqoecu' /* Durchschnittliche Raumtemperat... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController4 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'bsy7upwt' /* <= 17 °C */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'or8lh8sq' /* 18 - 19 °C */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6pvynl8e' /* 20 - 22 °C */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'b660m23o' /* > 22 °C */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue4 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e..temp = _model.dropDownValue4,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '3fc4s77g' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'r9kts1mi' /* Beheizte Fläche */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController5 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from(
                                        [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'lv6qihmh' /* > 30 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'tlxom7j7' /* 30 - 50 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'b5r2pa2g' /* 51 - 75 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'tli6oi6h' /* 76 - 100 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '2z04v7q7' /* 101 - 125 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'uwf8nrb5' /* 126 - 150 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'eyhj3n3f' /* 151 - 200 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'l1nwdzx1' /* 201 - 300 m2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'g39tawet' /* > 300 m2 */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue5 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e..area = _model.dropDownValue5,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'onvhk8be' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'ksdyyas3' /* Wie viele Personen wohnen in d... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController6 ??=
                                            FormFieldController<int>(null),
                                    options:
                                        List<int>.from([0, 1, 2, 3, 4, 5, 6]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'v5ottzle' /* 1 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'njmjj41x' /* 2 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ho1xu5en' /* 3 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'e9oy1tj2' /* 4 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vvm2wesy' /* 5 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'g9w6nhin' /* 6 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'r5f0xgw1' /* 7 (oder mehr) */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue6 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..persons = _model.dropDownValue6,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'mtqesr6p' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                              ],
                            ),
                          );
                        } else if (_model.choiceChipsValue == 'Energie') {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 25.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9ibfs9k8' /* Wie wird dein Wasser geheizt? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController7 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from(
                                        [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'dl8caxmz' /* Ölheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ahqn2ymg' /* Ölheizung mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'l06z4c4b' /* Gasheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '5au3z11t' /* Gasheizung mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'h77h1drn' /* Fernwärme */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'askk23f8' /* Elektroheizung */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'jn2eywha' /* Wärmepumpe */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '5sfd5d0y' /* Holz mit Solarpanels */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        're36e7v2' /* Holz (Pellets, Scheite) */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue7 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..warmWaterType =
                                              _model.dropDownValue7,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'xwg0vh0o' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'tzim5rkt' /* Welche (durchschnittliche) Ene... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController8 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4, 5]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'zt2zmlcc' /* Schlechter als A */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'h6prmtjm' /* A */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'urqvnryj' /* A+ */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'qpuj1z1p' /* A++ */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ovwnl24h' /* Keine Ahnung - die meisten Ger... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ukn3i1sq' /* Keine Ahnung - die meisten Ger... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue8 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..efficiency = _model.dropDownValue8,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'l6q90jy8' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '9bdmi9jt' /* Welche Kühlgeräte nutzt  du? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController9 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'vdqq4j6y' /* Kühlschrank mit Gefrierfach */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'v9b3gdcy' /* Kühlschrank/Tiefkühlerkombinat... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '29bgaktc' /* Kühlschrank mit Gefierfach und... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'caa2gnno' /* Mehrere Kühlschränke und/oder ... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue9 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..fridge = _model.dropDownValue9,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'gick2gkw' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '0q34d839' /* Wie wäschst du deine Wäsche? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController10 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'ro10vtup' /* Über die Hälfte 30 °C und weni... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'elou24n6' /* Den grössten Teil 40 °C, ca. 1... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'xl9q5l4v' /* Gemäss Herstellerangabe, geleg... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue10 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..washing = _model.dropDownValue10,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'nsdnbnlh' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '5z7sqmdm' /* Wie trocknest du deine Wäsche? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController11 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'd7uys7q6' /* Wäscheleine */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vj3xwq7c' /* Teils im Tumbler / teils an de... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ihy4xsrs' /* Nur im Tumbler */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue11 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..drying = _model.dropDownValue11,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'alm1ihg8' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'gmlh6wr2' /* Welcher Anteil deines Stroms l... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController12 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'w8es0bho' /* Kein Anteil */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'rijozni0' /* Ein Teil davon */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'kak476xt' /* Alles */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue12 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e..eco = _model.dropDownValue12,
                                      );
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'h4motw7u' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 25.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ip51ualp' /* Wie hoch sind deine monatliche... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                        'bn7ggdbb' /* Schuhe und Kleidung? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController13 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'ktr8go8d' /* Sehr tief (ca. 20 CHF oder wen... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'env5v31p' /* Tief (ca. 50 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'jdm4fgzu' /* Durchschnitt (ca. 100 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'qu3dh0wt' /* Hoch (ca. 125 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'q1xczzm2' /* Sehr hoch (ca. 250 CHF oder me... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue13 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..clothes = _model.dropDownValue13,
                                      );
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'tb7ru4md' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'gqsh9nwg' /* Hobbies, Freizeitaktivitäten u... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController14 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'btcy3h8k' /* Sehr tief (50 CHF oder weniger... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'nm0qaup6' /* Tief (ca. 150 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'l58mv59b' /* Durchschnitt (ca. 260 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'o3lqbni8' /* Hoch (ca. 400 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '5i2y5inm' /* Sehr hoch (ca. 600 CHF oder me... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue14 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..entertainment =
                                              _model.dropDownValue14,
                                      );
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'v2t08tgj' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '2vd1vzy3' /* Möbel und Haushaltsgeräte? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController15 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'xsdif0pr' /* Sehr tief (25 CHF oder weniger... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ta5brzr1' /* Tief (ca. 75 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'iyufkpuo' /* Durchschnitt (ca. 125 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6oxi5pcb' /* Hoch (ca. 200 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'dswl1puh' /* Sehr hoch (ca. 300 CHF oder me... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue15 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..furniture = _model.dropDownValue15,
                                      );
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'vypx4aky' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        'bdro2mvu' /* Auswertige Verpflegung? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController16 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'c304rida' /* Sehr tief (50 CHF oder weniger... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '8l0jd8bm' /* Tief (ca. 100 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'zvy1faue' /* Durchschnitt (ca. 250 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'y7yb56aw' /* Hoch (ca. 400 CHF) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'liw8aq00' /* Sehr hoch (ca. 600 CHF oder me... */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue16 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) =>
                                            e..eatOut = _model.dropDownValue16,
                                      );
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'hec30axn' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        '46houobh' /* Welcher Anteil deiner Ersparni... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController17 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([0, 1, 2, 3, 4]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'werzsu60' /* Kein Anteil */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'cyqele2v' /* Wenig */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'btgbk52n' /* Viel */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'x92a37wm' /* Alles */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '1qq31j1q' /* Keine Ahnung */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue17 = val);
                                      FFAppState().updateLifestyleStruct(
                                        (e) => e
                                          ..investments =
                                              _model.dropDownValue17,
                                      );
                                      safeSetState(() {});
                                      FFAppState().InitialSetupDone = true;
                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'fgtcvbws' /* Bitte auswählen */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.aPICallStatus = await MeAndMyPlanetMockAPIGroup
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

                      if ((_model.aPICallStatus?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Änderungen gespeichert',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Änderungen konnten nicht gespeichert werden. Bitte versuche es später erneut',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).error,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }

                      context.pushNamed('Erfassen');

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '2teo2fl5' /* Anpassungen speichern */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        ),
      ),
    );
  }
}
