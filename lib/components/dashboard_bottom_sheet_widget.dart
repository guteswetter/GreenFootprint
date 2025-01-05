import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_bottom_sheet_model.dart';
export 'dashboard_bottom_sheet_model.dart';

class DashboardBottomSheetWidget extends StatefulWidget {
  const DashboardBottomSheetWidget({
    super.key,
    bool? isWeekly,
  }) : isWeekly = isWeekly ?? true;

  final bool isWeekly;

  @override
  State<DashboardBottomSheetWidget> createState() =>
      _DashboardBottomSheetWidgetState();
}

class _DashboardBottomSheetWidgetState
    extends State<DashboardBottomSheetWidget> {
  late DashboardBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'lompet3b' /* Total CO2e nach Item */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
                ),
              ),
            ),
            if (widget.isWeekly == true)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final emissionsListWeekly = FFAppState()
                        .DashboardData
                        .sortedList(keyOf: (e) => e.totalCO2weekly, desc: true)
                        .where((e) => e.totalCO2weekly > 0.0)
                        .toList();

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: emissionsListWeekly.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 2.0),
                      itemBuilder: (context, emissionsListWeeklyIndex) {
                        final emissionsListWeeklyItem =
                            emissionsListWeekly[emissionsListWeeklyIndex];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${(emissionsListWeeklyIndex + 1).toString()}.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    FFAppState()
                                        .ZutatenListe
                                        .where((e) =>
                                            e.id ==
                                            emissionsListWeeklyItem.itemID)
                                        .toList()
                                        .firstOrNull
                                        ?.name,
                                    'Item not found',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                decoration: const BoxDecoration(),
                              ),
                              Container(
                                width: 50.0,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      emissionsListWeeklyItem.totalCO2weekly,
                                      formatType: FormatType.custom,
                                      format: '#.##',
                                      locale: '',
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'l2z1q299' /* kg */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(width: 10.0))
                                .around(const SizedBox(width: 10.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (widget.isWeekly == false)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final emissionsList = FFAppState()
                        .DashboardData
                        .sortedList(keyOf: (e) => e.totalCO2weekly, desc: true)
                        .where((e) => e.totalCO2weekly > 0.0)
                        .toList();

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: emissionsList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 2.0),
                      itemBuilder: (context, emissionsListIndex) {
                        final emissionsListItem =
                            emissionsList[emissionsListIndex];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${(emissionsListIndex + 1).toString()}.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    FFAppState()
                                        .ZutatenListe
                                        .where((e) =>
                                            e.id == emissionsListItem.itemID)
                                        .toList()
                                        .firstOrNull
                                        ?.name,
                                    'Item not found',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                decoration: const BoxDecoration(),
                              ),
                              Container(
                                width: 50.0,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      emissionsListItem.totalCO2weekly,
                                      formatType: FormatType.custom,
                                      format: '#.##',
                                      locale: '',
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '1tokl1s9' /* kg */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(width: 10.0))
                                .around(const SizedBox(width: 10.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
