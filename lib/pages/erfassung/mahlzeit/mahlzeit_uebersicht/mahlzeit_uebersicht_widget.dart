import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mahlzeit_uebersicht_model.dart';
export 'mahlzeit_uebersicht_model.dart';

class MahlzeitUebersichtWidget extends StatefulWidget {
  const MahlzeitUebersichtWidget({super.key});

  @override
  State<MahlzeitUebersichtWidget> createState() =>
      _MahlzeitUebersichtWidgetState();
}

class _MahlzeitUebersichtWidgetState extends State<MahlzeitUebersichtWidget> {
  late MahlzeitUebersichtModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MahlzeitUebersichtModel());
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
      child: WillPopScope(
        onWillPop: () async => false,
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
                          context.goNamed('Erfassen');
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'a7o5twdg' /* Neue Mahlzeit erfassen */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 80.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .pushNamed('MahlzeitZutatenAuswaehlen');
                                },
                                child: Container(
                                  width: 260.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0x252C7869),
                                        Color(0x2BC2CFC5)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, -0.5),
                                      end: AlignmentDirectional(-1.0, 0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'm88vnkgp' /* Mahlzeit erfassen */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.add_circle_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'q1ehbreh' /* oder Mahlzeiten 
bearbeiten */
                                  ,
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
                        ],
                      ),
                    ),
                    Container(
                      height: 280.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final mahlzeitenByID = functions
                                .filterByMengeAndID(
                                    FFAppState().Mahlzeiten.toList(), false)
                                .unique((e) => e.mahlzeitID)
                                .sortedList(
                                    keyOf: (e) => e.mahlzeitID, desc: true)
                                .toList()
                                .take(25)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: mahlzeitenByID.length,
                              itemBuilder: (context, mahlzeitenByIDIndex) {
                                final mahlzeitenByIDItem =
                                    mahlzeitenByID[mahlzeitenByIDIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 5.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.current = 0;
                                      _model.totalItems = FFAppState()
                                          .Mahlzeiten
                                          .where((e) =>
                                              e.mahlzeitID ==
                                              mahlzeitenByIDItem.mahlzeitID)
                                          .toList()
                                          .length;
                                      while (_model.current! <
                                          _model.totalItems!) {
                                        FFAppState().addToMahlzeitEinzeln(
                                            MahlzeitListeStruct(
                                          mahlzeitID: FFAppState()
                                              .Mahlzeiten
                                              .where((e) =>
                                                  e.mahlzeitID ==
                                                  mahlzeitenByIDItem.mahlzeitID)
                                              .toList()
                                              .elementAtOrNull(_model.current!)
                                              ?.mahlzeitID,
                                          itemID: FFAppState()
                                              .Mahlzeiten
                                              .where((e) =>
                                                  e.mahlzeitID ==
                                                  mahlzeitenByIDItem.mahlzeitID)
                                              .toList()
                                              .elementAtOrNull(_model.current!)
                                              ?.itemID,
                                          datum: FFAppState()
                                              .Mahlzeiten
                                              .where((e) =>
                                                  e.mahlzeitID ==
                                                  mahlzeitenByIDItem.mahlzeitID)
                                              .toList()
                                              .elementAtOrNull(_model.current!)
                                              ?.datum,
                                          menge: FFAppState()
                                              .Mahlzeiten
                                              .where((e) =>
                                                  e.mahlzeitID ==
                                                  mahlzeitenByIDItem.mahlzeitID)
                                              .toList()
                                              .elementAtOrNull(_model.current!)
                                              ?.menge,
                                          entryID: FFAppState()
                                              .Mahlzeiten
                                              .where((e) =>
                                                  e.mahlzeitID ==
                                                  mahlzeitenByIDItem.mahlzeitID)
                                              .toList()
                                              .elementAtOrNull(_model.current!)
                                              ?.entryID,
                                        ));
                                        _model.current = _model.current! + 1;
                                      }

                                      context.pushNamed(
                                        'MahlzeitBearbeiten',
                                        queryParameters: {
                                          'mahlzeitID': serializeParam(
                                            mahlzeitenByIDItem.mahlzeitID,
                                            ParamType.int,
                                          ),
                                          'date': serializeParam(
                                            mahlzeitenByIDItem.datum,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        title: Text(
                                          FFLocalizations.of(context).getText(
                                            'kf8yb145' /* Erfasste Mahlzeit */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          dateTimeFormat(
                                            "d/M H:mm",
                                            DateTime.fromMicrosecondsSinceEpoch(
                                                mahlzeitenByIDItem.mahlzeitID),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                12.0, 0.0, 12.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
