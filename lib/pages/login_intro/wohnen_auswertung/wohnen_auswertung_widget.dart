import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'wohnen_auswertung_model.dart';
export 'wohnen_auswertung_model.dart';

class WohnenAuswertungWidget extends StatefulWidget {
  const WohnenAuswertungWidget({
    super.key,
    double? housingCo2,
    double? energyCo2,
    double? consumptionCo2,
  })  : housingCo2 = housingCo2 ?? 0.0,
        energyCo2 = energyCo2 ?? 0.0,
        consumptionCo2 = consumptionCo2 ?? 0.0;

  final double housingCo2;
  final double energyCo2;
  final double consumptionCo2;

  @override
  State<WohnenAuswertungWidget> createState() => _WohnenAuswertungWidgetState();
}

class _WohnenAuswertungWidgetState extends State<WohnenAuswertungWidget> {
  late WohnenAuswertungModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WohnenAuswertungModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.lifestyleEmissionsResult =
          await MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall.call(
        bearerAuth: currentAuthenticationToken,
      );

      if ((_model.lifestyleEmissionsResult?.succeeded ?? true)) {
        _model.housingCo2 = getJsonField(
              (_model.lifestyleEmissionsResult?.jsonBody ?? ''),
              r'''$.housing_co2''',
            ) /
            365;
        _model.energyCo2 = getJsonField(
              (_model.lifestyleEmissionsResult?.jsonBody ?? ''),
              r'''$.energy_co2''',
            ) /
            365;
        _model.consumptionCo2 =
            FFAppState().LifestyleEmissions.consumption.annual / 365;
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
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
                      context.safePop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0nps22yh' /* Gut gemacht! */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 15.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qqdq5ukn' /* Unten siehst du den ersten Tei... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 50.0),
                        child: SizedBox(
                          width: 370.0,
                          height: 230.0,
                          child: Stack(
                            children: [
                              FlutterFlowPieChart(
                                data: FFPieChartData(
                                  values: [
                                    _model.housingCo2!,
                                    _model.energyCo2!,
                                    _model.consumptionCo2!
                                  ],
                                  colors: [
                                    FlutterFlowTheme.of(context).accent1,
                                    FlutterFlowTheme.of(context).accent2,
                                    FlutterFlowTheme.of(context).accent3
                                  ],
                                  radius: [100.0, 100.0, 100.0],
                                ),
                                donutHoleRadius: 0.0,
                                donutHoleColor: Colors.transparent,
                                sectionLabelType:
                                    PieChartSectionLabelType.value,
                                sectionLabelStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: FlutterFlowChartLegendWidget(
                                  entries: [
                                    LegendEntry(
                                        FlutterFlowTheme.of(context).accent1,
                                        FFLocalizations.of(context).getText(
                                          'twmszqiq' /* Wohnen */,
                                        )),
                                    LegendEntry(
                                        FlutterFlowTheme.of(context).accent2,
                                        FFLocalizations.of(context).getText(
                                          'k62vectl' /* Energie */,
                                        )),
                                    LegendEntry(
                                        FlutterFlowTheme.of(context).accent3,
                                        FFLocalizations.of(context).getText(
                                          'lyi19zcw' /* Konsum */,
                                        )),
                                  ],
                                  width: 100.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  textPadding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 2.0, 5.0, 2.0),
                                  borderWidth: 1.0,
                                  indicatorSize: 10.0,
                                  indicatorBorderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('Dashboard');
                        },
                        text: FFLocalizations.of(context).getText(
                          '269a835d' /* Zum Dashboard */,
                        ),
                        options: FFButtonOptions(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
