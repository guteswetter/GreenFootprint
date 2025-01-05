import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'erfassen_model.dart';
export 'erfassen_model.dart';

class ErfassenWidget extends StatefulWidget {
  const ErfassenWidget({
    super.key,
    this.zutatID,
    this.zutatMenge,
  });

  final List<int>? zutatID;
  final List<double>? zutatMenge;

  @override
  State<ErfassenWidget> createState() => _ErfassenWidgetState();
}

class _ErfassenWidgetState extends State<ErfassenWidget> {
  late ErfassenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErfassenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getUnits =
          await MeAndMyPlanetMockAPIGroup.requestUnitsMetadataCall.call();

      if ((_model.getUnits?.succeeded ?? true)) {
        FFAppState().Units = [];
        FFAppState().Units = ((_model.getUnits?.jsonBody ?? '')
                .toList()
                .map<UnitsSchemaStruct?>(UnitsSchemaStruct.maybeFromMap)
                .toList() as Iterable<UnitsSchemaStruct?>)
            .withoutNulls
            .toList()
            .cast<UnitsSchemaStruct>();
      }
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
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(1.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
            child: FloatingActionButton(
              onPressed: () async {
                var shouldSetState = false;
                FFAppState().MahlzeitEinzeln = [];
                safeSetState(() {});
                _model.current = 0;
                _model.totalItems = 2;
                _model.mahlzeitID = getCurrentTimestamp.microsecondsSinceEpoch;
                _model.datum = dateTimeFormat(
                  "y-M-d",
                  getCurrentTimestamp,
                  locale: FFLocalizations.of(context).languageCode,
                );
                safeSetState(() {});
                FFAppState().addToMahlzeitEinzeln(MahlzeitListeStruct(
                  mahlzeitID: _model.mahlzeitID,
                  itemID: 505,
                  datum: _model.datum,
                  menge: 0.1,
                ));
                safeSetState(() {});
                FFAppState().addToMahlzeitEinzeln(MahlzeitListeStruct(
                  mahlzeitID: _model.mahlzeitID,
                  itemID: 508,
                  datum: _model.datum,
                  menge: 0.012,
                ));
                safeSetState(() {});
                while (_model.current < _model.totalItems) {
                  if (functions.filteredListLength(
                          FFAppState().Mahlzeiten.toList(),
                          FFAppState()
                              .MahlzeitEinzeln
                              .elementAtOrNull(_model.current)
                              ?.itemID,
                          _model.datum) >
                      0) {
                    _model.entryID = functions.getFilteredEntryID(
                        FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.itemID,
                        _model.datum,
                        FFAppState().Mahlzeiten.toList());
                    _model.mengeAlt = functions.getTotalMenge(
                        FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.itemID,
                        _model.datum,
                        FFAppState().Mahlzeiten.toList())!;
                    safeSetState(() {});
                    _model.updateByEntryID = await MeAndMyPlanetMockAPIGroup
                        .editExistingDataInDatabaseByEntryIDCall
                        .call(
                      bearerAuth: currentAuthenticationToken,
                      entryID: _model.entryID?.toString(),
                      amountNumeric: _model.mengeAlt +
                          FFAppState()
                              .MahlzeitEinzeln
                              .elementAtOrNull(_model.current)!
                              .menge,
                      amountOption: 0,
                    );

                    shouldSetState = true;
                    if ((_model.updateByEntryID?.succeeded ?? true)) {
                      FFAppState().addToMahlzeiten(MahlzeitListeTotalStruct(
                        mahlzeitID: _model.mahlzeitID,
                        itemID: FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.itemID,
                        entryID: _model.entryID,
                        datum: _model.datum,
                        menge: FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.menge,
                      ));
                      safeSetState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erfassen nicht möglich. Bitte später erneut versuchen.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (shouldSetState) safeSetState(() {});
                      return;
                    }

                    _model.entryID = null;
                    _model.mengeAlt = 0.0;
                    safeSetState(() {});
                  } else {
                    _model.getEntryID =
                        await MeAndMyPlanetMockAPIGroup.addDailyCall.call(
                      bearerAuth: currentAuthenticationToken,
                      date: _model.datum,
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
                    if ((_model.getEntryID?.succeeded ?? true)) {
                      FFAppState().addToMahlzeiten(MahlzeitListeTotalStruct(
                        mahlzeitID: _model.mahlzeitID,
                        itemID: FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.itemID,
                        entryID: MeAndMyPlanetMockAPIGroup.addDailyCall.entryID(
                          (_model.getEntryID?.jsonBody ?? ''),
                        ),
                        datum: _model.datum,
                        menge: FFAppState()
                            .MahlzeitEinzeln
                            .elementAtOrNull(_model.current)
                            ?.menge,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erfassen nicht möglich. Bitte später erneut versuchen.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (shouldSetState) safeSetState(() {});
                      return;
                    }
                  }

                  _model.current = _model.current + 1;
                }
                FFAppState().MahlzeitEinzeln = [];
                FFAppState().DropdownValues = [];
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Kaffee gespeichert!',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                if (shouldSetState) safeSetState(() {});
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.coffee,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 25.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qrij72p3' /* Welche Daten willst du erfasse... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MahlzeitUebersicht');
                              },
                              child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFA8BDB8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.fastfood_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'x39veudv' /* Mahlzeit */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('WohnenBearbeiten');
                              },
                              child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFA8BDB8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.house_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 60.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gjg79ae0' /* Wohnen */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ReiseUebersicht');
                              },
                              child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFA8BDB8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.train,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'vvvs6dil' /* Reise  */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('FlugUebersicht');
                              },
                              child: Container(
                                width: 125.0,
                                height: 125.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFA8BDB8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.airplanemode_active,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '21m94k65' /* Flug  */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
