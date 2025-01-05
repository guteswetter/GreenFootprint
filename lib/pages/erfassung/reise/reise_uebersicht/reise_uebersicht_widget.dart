import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_widget_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'reise_uebersicht_model.dart';
export 'reise_uebersicht_model.dart';

class ReiseUebersichtWidget extends StatefulWidget {
  const ReiseUebersichtWidget({super.key});

  @override
  State<ReiseUebersichtWidget> createState() => _ReiseUebersichtWidgetState();
}

class _ReiseUebersichtWidgetState extends State<ReiseUebersichtWidget> {
  late ReiseUebersichtModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReiseUebersichtModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().Reisen = [];
      _model.totalItems =
          FFAppState().Mahlzeiten.where((e) => e.itemID <= 10).toList().length;
      _model.current = 0;
      while (_model.current! < _model.totalItems!) {
        FFAppState().addToReisen(MahlzeitListeTotalStruct(
          mahlzeitID: FFAppState()
              .Mahlzeiten
              .where((e) => e.itemID <= 10)
              .toList()
              .elementAtOrNull(_model.current!)
              ?.mahlzeitID,
          itemID: FFAppState()
              .Mahlzeiten
              .where((e) => e.itemID <= 10)
              .toList()
              .elementAtOrNull(_model.current!)
              ?.itemID,
          entryID: FFAppState()
              .Mahlzeiten
              .where((e) => e.itemID <= 10)
              .toList()
              .elementAtOrNull(_model.current!)
              ?.entryID,
          datum: FFAppState()
              .Mahlzeiten
              .where((e) => e.itemID <= 10)
              .toList()
              .elementAtOrNull(_model.current!)
              ?.datum,
          menge: FFAppState()
              .Mahlzeiten
              .where((e) => e.itemID <= 10)
              .toList()
              .elementAtOrNull(_model.current!)
              ?.menge,
        ));
        safeSetState(() {});
        _model.current = _model.current! + 1;
        safeSetState(() {});
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
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
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7cy71p73' /* Neue Reise erfassen */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                      child: Container(
                        width: 260.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0x252C7869), Color(0x2BC2CFC5)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -0.5),
                            end: AlignmentDirectional(-1.0, 0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ReiseErfassen');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'u5i6iowz' /* oder 
Reise löschen */
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
                          SafeArea(
                            child: Container(
                              height: 280.0,
                              decoration: const BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final reisen = functions
                                      .filterByMengeAndID(
                                          FFAppState().Mahlzeiten.toList(),
                                          true)
                                      .sortedList(
                                          keyOf: (e) => e.mahlzeitID,
                                          desc: true)
                                      .toList()
                                      .take(25)
                                      .toList();
                                  if (reisen.isEmpty) {
                                    return const EmptyWidgetPlaceholderWidget();
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: reisen.length,
                                    itemBuilder: (context, reisenIndex) {
                                      final reisenItem = reisen[reisenIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 5.0),
                                        child: Slidable(
                                          endActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            extentRatio: 0.25,
                                            children: [
                                              SlidableAction(
                                                label:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7gsmc0sg' /* Delete */,
                                                ),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                icon: Icons
                                                    .delete_outline_rounded,
                                                onPressed: (_) async {
                                                  _model.apiResultanx =
                                                      await MeAndMyPlanetMockAPIGroup
                                                          .editExistingDataInDatabaseByEntryIDCall
                                                          .call(
                                                    entryID: reisenItem.entryID
                                                        .toString(),
                                                    bearerAuth:
                                                        currentAuthenticationToken,
                                                    amountNumeric: (functions
                                                            .getTotalMenge(
                                                                reisenItem
                                                                    .itemID,
                                                                reisenItem
                                                                    .datum,
                                                                FFAppState()
                                                                    .Mahlzeiten
                                                                    .toList())!) -
                                                        reisenItem.menge,
                                                  );

                                                  if ((_model.apiResultanx
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState()
                                                        .updateMahlzeitenAtIndex(
                                                      functions
                                                          .findIndexFromReise(
                                                              FFAppState()
                                                                  .Mahlzeiten
                                                                  .toList(),
                                                              reisenItem
                                                                  .mahlzeitID),
                                                      (e) => e
                                                        ..menge = _model.set0,
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                '${FFAppState().ZutatenListe.where((e) => e.id == reisenItem.itemID).toList().firstOrNull?.name} - ${reisenItem.menge.toString()} km',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              subtitle: Text(
                                                reisenItem.datum,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
