import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_placeholder_widget.dart';
import '/components/zutaten_liste_menge_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'mahlzeit_zutaten_auswaehlen_model.dart';
export 'mahlzeit_zutaten_auswaehlen_model.dart';

class MahlzeitZutatenAuswaehlenWidget extends StatefulWidget {
  const MahlzeitZutatenAuswaehlenWidget({super.key});

  @override
  State<MahlzeitZutatenAuswaehlenWidget> createState() =>
      _MahlzeitZutatenAuswaehlenWidgetState();
}

class _MahlzeitZutatenAuswaehlenWidgetState
    extends State<MahlzeitZutatenAuswaehlenWidget> {
  late MahlzeitZutatenAuswaehlenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MahlzeitZutatenAuswaehlenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.mahlzeitVollstaendig = false;
      _model.entryID = null;
      _model.mengeNeu = null;
      _model.mahlzeitID = getCurrentTimestamp.microsecondsSinceEpoch;
    });

    _model.datumTextFieldTextController ??= TextEditingController();
    _model.datumTextFieldFocusNode ??= FocusNode();

    _model.mengeTextFieldTextController ??= TextEditingController();
    _model.mengeTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.datumTextFieldTextController?.text = dateTimeFormat(
            "y-M-d",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().DropdownValues = [];
      FFAppState().MahlzeitEinzeln = [];
      FFAppState().co2Total = [];
      safeSetState(() {
        _model.dropDownValueController?.reset();
      });
    }();

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 40.0,
                        ),
                        onPressed: () async {
                          context.goNamed('MahlzeitUebersicht');
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 25.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2f2a30os' /* Neue Mahlzeit erfassen */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 32.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        datePickedDate.year,
                                        datePickedDate.month,
                                        datePickedDate.day,
                                      );
                                    });
                                  }
                                  if (_model.datePicked != null) {
                                    safeSetState(() {
                                      _model.datumTextFieldTextController
                                          ?.text = dateTimeFormat(
                                        "y-M-d",
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .datumTextFieldTextController,
                                                focusNode: _model
                                                    .datumTextFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '70ecjeoa' /* TextField */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .datumTextFieldTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_month,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<int>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<int>(
                                    _model.dropDownValue ??= null,
                                  ),
                                  options: List<int>.from(FFAppState()
                                      .ZutatenListe
                                      .where((e) => e.id > 10)
                                      .toList()
                                      .map((e) => e.id)
                                      .toList()),
                                  optionLabels: FFAppState()
                                      .ZutatenListe
                                      .where((e) => e.id > 10)
                                      .toList()
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue = val);
                                    _model.unit = FFAppState()
                                        .ZutatenListe
                                        .where(
                                            (e) => e.id == _model.dropDownValue)
                                        .toList()
                                        .firstOrNull!
                                        .unitType;
                                    safeSetState(() {});
                                  },
                                  width: 200.0,
                                  height: 40.0,
                                  maxHeight: 300.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '5r96ivj5' /* Zutat auswählen.. */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    'vpk9wza5' /* Zutat suchen... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                              ),
                              SizedBox(
                                width: 50.0,
                                child: TextFormField(
                                  controller:
                                      _model.mengeTextFieldTextController,
                                  focusNode: _model.mengeTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'hafg3jk2' /* 0 */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .mengeTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .Units
                                      .where((e) => e.id == _model.unit)
                                      .toList()
                                      .firstOrNull
                                      ?.name,
                                  'kg',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState()
                                    .addToMahlzeitEinzeln(MahlzeitListeStruct(
                                  mahlzeitID: _model.mahlzeitID,
                                  itemID: _model.dropDownValue,
                                  datum:
                                      _model.datumTextFieldTextController.text,
                                  menge: double.tryParse(
                                      _model.mengeTextFieldTextController.text),
                                  co2: valueOrDefault<double>(
                                    double.parse(_model
                                            .mengeTextFieldTextController
                                            .text) *
                                        FFAppState()
                                            .ZutatenListe
                                            .where((e) =>
                                                e.id == _model.dropDownValue)
                                            .toList()
                                            .firstOrNull!
                                            .co2eqPerUnit,
                                    0.0,
                                  ),
                                ));
                                FFAppState().update(() {});
                                safeSetState(() {
                                  _model.mengeTextFieldTextController?.clear();
                                });
                                safeSetState(() {
                                  _model.dropDownValueController?.reset();
                                });
                              },
                              text: FFLocalizations.of(context).getText(
                                'k6ksti1g' /* Zutat hinzufügen */,
                              ),
                              icon: const Icon(
                                Icons.add_circle,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxHeight: 200.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 5.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dbkmaeu5' /* Zutatenübersicht: */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            if (_model.editMode == false)
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.editMode = true;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            if (_model.editMode == true)
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.edit_off,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.editMode = false;
                                                  safeSetState(() {});
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 10.0, 5.0, 5.0),
                                        child: Builder(
                                          builder: (context) {
                                            final menuList = FFAppState()
                                                .MahlzeitEinzeln
                                                .toList();
                                            if (menuList.isEmpty) {
                                              return const EmptyWidgetPlaceholderWidget();
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: menuList.length,
                                              itemBuilder:
                                                  (context, menuListIndex) {
                                                final menuListItem =
                                                    menuList[menuListIndex];
                                                return ZutatenListeMengeWidget(
                                                  key: Key(
                                                      'Keyctf_${menuListIndex}_of_${menuList.length}'),
                                                  mahlzeitID: _model.mahlzeitID,
                                                  itemID: FFAppState()
                                                      .MahlzeitEinzeln
                                                      .elementAtOrNull(
                                                          menuListIndex)
                                                      ?.itemID,
                                                  unitType: FFAppState()
                                                      .ZutatenListe
                                                      .where((e) =>
                                                          e.id ==
                                                          menuListItem.itemID)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.unitType,
                                                  index: menuListIndex,
                                                  date: _model.datePicked ==
                                                          null
                                                      ? dateTimeFormat(
                                                          "y-M-d",
                                                          getCurrentTimestamp,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )
                                                      : dateTimeFormat(
                                                          "y-M-d",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                  menge: menuListItem.menge,
                                                  editMode: _model.editMode,
                                                  co2eqPerUnit: FFAppState()
                                                      .ZutatenListe
                                                      .where((e) =>
                                                          e.id ==
                                                          menuListItem.itemID)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.co2eqPerUnit,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7d1zkgpq' /* Total CO2e dieser Mahlzeit: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          formatNumber(
                                            (List<double> list) {
                                              return list.fold<double>(
                                                  0.0,
                                                  (double previous,
                                                          double current) =>
                                                      previous + current);
                                            }(FFAppState()
                                                .MahlzeitEinzeln
                                                .map((e) => e.co2)
                                                .toList()),
                                            formatType: FormatType.custom,
                                            format: '##.##',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'c57a2iwf' /* kg */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 5.0))
                                      .around(const SizedBox(width: 5.0)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 40.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var shouldSetState = false;
                                    _model.totalItems =
                                        FFAppState().MahlzeitEinzeln.length;
                                    safeSetState(() {});
                                    while (
                                        _model.current < _model.totalItems!) {
                                      if (functions.filteredListLength(
                                              FFAppState().Mahlzeiten.toList(),
                                              FFAppState()
                                                  .MahlzeitEinzeln
                                                  .elementAtOrNull(
                                                      _model.current)
                                                  ?.itemID,
                                              FFAppState()
                                                  .MahlzeitEinzeln
                                                  .elementAtOrNull(
                                                      _model.current)
                                                  ?.datum) >
                                          0) {
                                        _model.entryID =
                                            functions.getFilteredEntryID(
                                                FFAppState()
                                                    .MahlzeitEinzeln
                                                    .elementAtOrNull(
                                                        _model.current)
                                                    ?.itemID,
                                                FFAppState()
                                                    .Mahlzeiten
                                                    .elementAtOrNull(
                                                        _model.current)
                                                    ?.datum,
                                                FFAppState()
                                                    .Mahlzeiten
                                                    .toList());
                                        _model.mengeNeu =
                                            functions.getTotalMenge(
                                                FFAppState()
                                                    .MahlzeitEinzeln
                                                    .elementAtOrNull(
                                                        _model.current)
                                                    ?.itemID,
                                                FFAppState()
                                                    .MahlzeitEinzeln
                                                    .elementAtOrNull(
                                                        _model.current)
                                                    ?.datum,
                                                FFAppState()
                                                    .Mahlzeiten
                                                    .toList());
                                        safeSetState(() {});
                                        _model.updateByEntryID =
                                            await MeAndMyPlanetMockAPIGroup
                                                .editExistingDataInDatabaseByEntryIDCall
                                                .call(
                                          bearerAuth:
                                              currentAuthenticationToken,
                                          entryID: _model.entryID?.toString(),
                                          amountNumeric: (_model.mengeNeu!) +
                                              FFAppState()
                                                  .MahlzeitEinzeln
                                                  .elementAtOrNull(
                                                      _model.current)!
                                                  .menge,
                                          amountOption: 0,
                                        );

                                        shouldSetState = true;
                                        if ((_model
                                                .updateByEntryID?.succeeded ??
                                            true)) {
                                          FFAppState().addToMahlzeiten(
                                              MahlzeitListeTotalStruct(
                                            mahlzeitID: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.mahlzeitID,
                                            itemID: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.itemID,
                                            entryID: _model.entryID,
                                            datum: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.datum,
                                            menge: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.menge,
                                          ));
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Fehler beim speichern der Mahlzeit. Fehlercode: ${(_model.updateByEntryID?.statusCode ?? 200).toString()} - ${(_model.updateByEntryID?.bodyText ?? '')}',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }

                                        _model.entryID = null;
                                        _model.mengeNeu = null;
                                        safeSetState(() {});
                                      } else {
                                        _model.getEntryID =
                                            await MeAndMyPlanetMockAPIGroup
                                                .addDailyCall
                                                .call(
                                          bearerAuth:
                                              currentAuthenticationToken,
                                          date: FFAppState()
                                              .MahlzeitEinzeln
                                              .elementAtOrNull(_model.current)
                                              ?.datum,
                                          amountNumeric: FFAppState()
                                              .MahlzeitEinzeln
                                              .elementAtOrNull(_model.current)
                                              ?.menge,
                                          amountOption: 0,
                                          itemID: FFAppState()
                                              .MahlzeitEinzeln
                                              .elementAtOrNull(_model.current)
                                              ?.itemID,
                                        );

                                        shouldSetState = true;
                                        if ((_model.getEntryID?.succeeded ??
                                            true)) {
                                          FFAppState().addToMahlzeiten(
                                              MahlzeitListeTotalStruct(
                                            mahlzeitID: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.mahlzeitID,
                                            itemID: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.itemID,
                                            entryID: MeAndMyPlanetMockAPIGroup
                                                .addDailyCall
                                                .entryID(
                                              (_model.getEntryID?.jsonBody ??
                                                  ''),
                                            ),
                                            datum: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.datum,
                                            menge: FFAppState()
                                                .MahlzeitEinzeln
                                                .elementAtOrNull(_model.current)
                                                ?.menge,
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Fehler beim speichern der Mahlzeit. Fehlercode: ${(_model.getEntryID?.statusCode ?? 200).toString()} - ${(_model.getEntryID?.bodyText ?? '')}',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                      }

                                      _model.current = _model.current + 1;
                                    }
                                    FFAppState().MahlzeitEinzeln = [];
                                    FFAppState().DropdownValues = [];
                                    FFAppState().co2Total = [];
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Mahlzeit erfolgreich gespeichert',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    context.pushNamed('MahlzeitUebersicht');

                                    if (shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'xmr5c6fs' /* Mahlzeit speichern */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
