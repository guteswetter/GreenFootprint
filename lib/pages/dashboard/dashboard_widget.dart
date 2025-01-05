import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/dashboard_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().GetLast7Days =
          functions.getLast7Days().toList().cast<String>();
      FFAppState().DashboardData = [];
      FFAppState().TotalEmissionsLastWeek = [];
      _model.currentDate = 0;
      _model.currentItem = 0;
      _model.totalDates = 7;
      _model.dailyIsEmpty = true;
      _model.weekyIsEmpty = true;
      safeSetState(() {});
      _model.getHousingEmissions =
          await MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall.call(
        bearerAuth: currentAuthenticationToken,
      );

      if ((_model.getHousingEmissions?.succeeded ?? true)) {
        FFAppState().updateLifestyleEmissionsStruct(
          (e) => e
            ..housing = EmissionsSchemaStruct(
              annual: MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall
                  .housingCO2(
                (_model.getHousingEmissions?.jsonBody ?? ''),
              ),
              weekly: (MeAndMyPlanetMockAPIGroup
                      .getLifestyleEmissionsForUserCall
                      .housingCO2(
                    (_model.getHousingEmissions?.jsonBody ?? ''),
                  )!) /
                  _model.weeks,
              daily: (MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall
                      .housingCO2(
                    (_model.getHousingEmissions?.jsonBody ?? ''),
                  )!) /
                  _model.days,
            )
            ..energy = EmissionsSchemaStruct(
              annual: MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall
                  .energyCO2(
                (_model.getHousingEmissions?.jsonBody ?? ''),
              ),
              weekly: (MeAndMyPlanetMockAPIGroup
                      .getLifestyleEmissionsForUserCall
                      .energyCO2(
                    (_model.getHousingEmissions?.jsonBody ?? ''),
                  )!) /
                  _model.weeks,
              daily: (MeAndMyPlanetMockAPIGroup.getLifestyleEmissionsForUserCall
                      .energyCO2(
                    (_model.getHousingEmissions?.jsonBody ?? ''),
                  )!) /
                  _model.days,
            )
            ..consumption = EmissionsSchemaStruct(
              annual: 4000.0,
              weekly: 76.92,
              daily: 10.96,
            ),
        );
        safeSetState(() {});
        _model.housingWeekly = FFAppState().LifestyleEmissions.housing.weekly +
            FFAppState().LifestyleEmissions.energy.weekly +
            FFAppState().LifestyleEmissions.consumption.weekly;
        _model.housingDaily = FFAppState().LifestyleEmissions.housing.daily +
            FFAppState().LifestyleEmissions.energy.daily +
            FFAppState().LifestyleEmissions.consumption.daily;
        safeSetState(() {});
      }
      _model.getItemsT0 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(0),
      );

      if ((_model.getItemsT0?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT0?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          FFAppState().addToDashboardData(DashboardSchemaStruct(
            itemID: (((_model.getItemsT0?.jsonBody ?? '')
                        .toList()
                        .map<GetItemPerDateSchemaStruct?>(
                            GetItemPerDateSchemaStruct.maybeFromMap)
                        .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                    .withoutNulls
                    .elementAtOrNull(_model.currentItem))
                ?.item,
            t0: (((_model.getItemsT0?.jsonBody ?? '')
                        .toList()
                        .map<GetItemPerDateSchemaStruct?>(
                            GetItemPerDateSchemaStruct.maybeFromMap)
                        .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                    .withoutNulls
                    .elementAtOrNull(_model.currentItem))
                ?.amountNumeric,
          ));
          safeSetState(() {});
          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT1 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(1),
      );

      if ((_model.getItemsT1?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT1?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT1?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT1?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t1 = (((_model.getItemsT1?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT1?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t1: (((_model.getItemsT1?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT2 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(2),
      );

      if ((_model.getItemsT2?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT2?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT2?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT2?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t2 = (((_model.getItemsT2?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT2?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t2: (((_model.getItemsT2?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT3 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(3),
      );

      if ((_model.getItemsT3?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT3?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT3?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT3?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t3 = (((_model.getItemsT3?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT3?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t3: (((_model.getItemsT3?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT4 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(4),
      );

      if ((_model.getItemsT4?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT4?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT4?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT4?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t4 = (((_model.getItemsT4?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT4?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t4: (((_model.getItemsT4?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT5 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(5),
      );

      if ((_model.getItemsT5?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT5?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT5?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT5?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t5 = (((_model.getItemsT5?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT5?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t5: (((_model.getItemsT5?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      _model.getItemsT6 = await MeAndMyPlanetMockAPIGroup
          .requestUserDataOfACertainCategoryByDateCall
          .call(
        bearerAuth: currentAuthenticationToken,
        dateString: FFAppState().GetLast7Days.elementAtOrNull(6),
      );

      if ((_model.getItemsT6?.succeeded ?? true)) {
        _model.totalItems = ((_model.getItemsT6?.jsonBody ?? '')
                .toList()
                .map<GetItemPerDateSchemaStruct?>(
                    GetItemPerDateSchemaStruct.maybeFromMap)
                .toList() as Iterable<GetItemPerDateSchemaStruct?>)
            .withoutNulls
            .length;
        _model.currentItem = 0;
        safeSetState(() {});
        while (_model.currentItem < _model.totalItems) {
          if (FFAppState()
                  .DashboardData
                  .where(
                      (e) =>
                          e.itemID ==
                          (((_model.getItemsT6?.jsonBody ?? '')
                                          .toList()
                                          .map<GetItemPerDateSchemaStruct?>(
                                              GetItemPerDateSchemaStruct
                                                  .maybeFromMap)
                                          .toList()
                                      as Iterable<GetItemPerDateSchemaStruct?>)
                                  .withoutNulls
                                  .elementAtOrNull(_model.currentItem))
                              ?.item)
                  .toList().isNotEmpty) {
            FFAppState().updateDashboardDataAtIndex(
              functions.findIndexFromDashboardList(
                  FFAppState().DashboardData.toList(),
                  ((_model.getItemsT6?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem)!
                      .item),
              (e) => e
                ..t6 = (((_model.getItemsT6?.jsonBody ?? '')
                            .toList()
                            .map<GetItemPerDateSchemaStruct?>(
                                GetItemPerDateSchemaStruct.maybeFromMap)
                            .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                        .withoutNulls
                        .elementAtOrNull(_model.currentItem))
                    ?.amountNumeric,
            );
            safeSetState(() {});
          } else {
            FFAppState().addToDashboardData(DashboardSchemaStruct(
              itemID: (((_model.getItemsT6?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.item,
              t6: (((_model.getItemsT6?.jsonBody ?? '')
                          .toList()
                          .map<GetItemPerDateSchemaStruct?>(
                              GetItemPerDateSchemaStruct.maybeFromMap)
                          .toList() as Iterable<GetItemPerDateSchemaStruct?>)
                      .withoutNulls
                      .elementAtOrNull(_model.currentItem))
                  ?.amountNumeric,
            ));
            safeSetState(() {});
          }

          _model.currentItem = _model.currentItem + 1;
          safeSetState(() {});
        }
      }
      FFAppState().DashboardData = functions
          .calculateDashboardTotalPerItem(FFAppState().DashboardData.toList())!
          .toList()
          .cast<DashboardSchemaStruct>();
      safeSetState(() {});
      _model.currentItem = 0;
      _model.totalItems = FFAppState().DashboardData.length;
      safeSetState(() {});
      while (_model.currentItem < _model.totalItems) {
        FFAppState().updateDashboardDataAtIndex(
          _model.currentItem,
          (e) => e
            ..totalCO2t0 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t0,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t1 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t1,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t2 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t2,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t3 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t3,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t4 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t4,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t5 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t5,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2t6 = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.t6,
                    0.0,
                  ) *
                  valueOrDefault<double>(
                    FFAppState()
                        .ZutatenListe
                        .where((e) => valueOrDefault<bool>(
                              e.id ==
                                  valueOrDefault<int>(
                                    FFAppState()
                                        .DashboardData
                                        .elementAtOrNull(_model.currentItem)
                                        ?.itemID,
                                    0,
                                  ),
                              true,
                            ))
                        .toList()
                        .firstOrNull
                        ?.co2eqPerUnit,
                    0.0,
                  ),
              0.0,
            )
            ..totalCO2weekly = valueOrDefault<double>(
              valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t0,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t1,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t2,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t3,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t4,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t5,
                    0.0,
                  ) +
                  valueOrDefault<double>(
                    FFAppState()
                        .DashboardData
                        .elementAtOrNull(_model.currentItem)
                        ?.totalCO2t6,
                    0.0,
                  ),
              0.0,
            ),
        );
        safeSetState(() {});
        _model.currentItem = _model.currentItem + 1;
        safeSetState(() {});
      }
      _model.getFlightData =
          await MeAndMyPlanetMockAPIGroup.listAllFlightsForThisUserCall.call(
        bearerAuth: currentAuthenticationToken,
      );

      if ((_model.getFlightData?.succeeded ?? true)) {
        _model.flightEmissionsDaily = ((List<double> list) {
              return list.fold<double>(
                  0.0, (double previous, double current) => previous + current);
            }(((_model.getFlightData?.jsonBody ?? '')
                    .toList()
                    .map<FlightSchemaStruct?>(FlightSchemaStruct.maybeFromMap)
                    .toList() as Iterable<FlightSchemaStruct?>)
                .withoutNulls
                .map((e) => e.co2eq)
                .toList()
                .toList())) /
            365;
        safeSetState(() {});
      }
      _model.nutritionDaily = (List<double> list) {
        return list.fold<double>(
            0.0, (double previous, double current) => previous + current);
      }(FFAppState()
          .DashboardData
          .where((e) => e.itemID > 10)
          .toList()
          .map((e) => e.totalCO2t0)
          .toList()
          .toList());
      _model.nutritionWeekly = (List<double> list) {
        return list.fold<double>(
            0.0, (double previous, double current) => previous + current);
      }(FFAppState()
          .DashboardData
          .where((e) => e.itemID > 10)
          .toList()
          .map((e) => e.totalCO2weekly)
          .toList()
          .toList());
      _model.transportationDaily = ((List<double> list) {
            return list.fold<double>(
                0.0, (double previous, double current) => previous + current);
          }(FFAppState()
              .DashboardData
              .where((e) => e.itemID <= 10)
              .toList()
              .map((e) => e.totalCO2t0)
              .toList()
              .toList())) +
          (_model.flightEmissionsDaily!);
      _model.transportationWeekly = ((List<double> list) {
            return list.fold<double>(
                0.0, (double previous, double current) => previous + current);
          }(FFAppState()
              .DashboardData
              .where((e) => e.itemID <= 10)
              .toList()
              .map((e) => e.totalCO2t0)
              .toList()
              .toList())) +
          ((_model.flightEmissionsDaily!) * 7);
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t0)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t0,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t1)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t1,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t2)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t2,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t3)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t3,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      FFAppState().update(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t4)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t4,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t5)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t5,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.housingDaily,
              0.0,
            ),
        0.0,
      ));
      safeSetState(() {});
      FFAppState().addToTotalEmissionsLastWeek(valueOrDefault<double>(
        valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID <= 10,
                        true,
                      ))
                  .toList()
                  .map((e) => e.totalCO2t6)
                  .toList()
                  .toList()),
              0.0,
            ) +
            valueOrDefault<double>(
              _model.flightEmissionsDaily,
              0.0,
            ) +
            valueOrDefault<double>(
              (List<double> list) {
                return list.fold<double>(0.0,
                    (double previous, double current) => previous + current);
              }(FFAppState()
                  .DashboardData
                  .where((e) => valueOrDefault<bool>(
                        e.itemID > 10,
                        true,
                      ))
                  .toList()
                  .map((e) => valueOrDefault<double>(
                        e.totalCO2t6,
                        0.0,
                      ))
                  .toList()
                  .toList()),
              0.0,
            ) +
            (_model.housingDaily!),
        0.0,
      ));
      safeSetState(() {});
      _model.isDataLoaded = true;
      _model.dailyMenge = (List<double> list) {
        return list.fold<double>(
            0.0, (double previous, double current) => previous + current);
      }(FFAppState().DashboardData.map((e) => e.t0).toList().toList());
      _model.weeklyMenge = (List<double> list) {
        return list.fold<double>(
            0.0, (double previous, double current) => previous + current);
      }(FFAppState().DashboardData.map((e) => e.totalMenge).toList().toList());
      if (_model.dailyMenge! > 0.0) {
        _model.dailyIsEmpty = false;
        safeSetState(() {});
      }
      if (_model.weeklyMenge! > 0.0) {
        _model.weekyIsEmpty = false;
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent4,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/blank-profile-picture-973460_1280.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '${FFAppState().User.displayName}\'s Dashboard',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        '4wftuxzs' /* Woche */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'pw4a27sa' /* Tag */,
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
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      iconColor: const Color(0x00000000),
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
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                      iconColor: const Color(0x00000000),
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 15.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [
                        FFLocalizations.of(context).getText(
                          '14aqzw7s' /* Woche */,
                        )
                      ],
                    ),
                    wrapped: true,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.choiceChipsValue == 'Woche') {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'spv55euu' /* Total CO2e diese Woche:  */,
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
                                          valueOrDefault<String>(
                                            formatNumber(
                                              (_model.housingWeekly!) +
                                                  (_model
                                                      .transportationWeekly!) +
                                                  (_model.nutritionWeekly!),
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
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xz0vnczb' /* kg */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Container(
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: SizedBox(
                                              width: 370.0,
                                              height: 230.0,
                                              child: Stack(
                                                children: [
                                                  FlutterFlowPieChart(
                                                    data: FFPieChartData(
                                                      values: [
                                                        _model.housingWeekly!,
                                                        _model.nutritionWeekly!,
                                                        _model
                                                            .transportationWeekly!
                                                      ],
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3
                                                      ],
                                                      radius: [
                                                        80.0,
                                                        82.0,
                                                        84.0
                                                      ],
                                                    ),
                                                    donutHoleRadius: 0.0,
                                                    donutHoleColor:
                                                        Colors.transparent,
                                                    sectionLabelType:
                                                        PieChartSectionLabelType
                                                            .value,
                                                    sectionLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child:
                                                        FlutterFlowChartLegendWidget(
                                                      entries: [
                                                        LegendEntry(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xaehcokq' /* Wohnen, Energie & Konsum */,
                                                            )),
                                                        LegendEntry(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ah5urdxm' /* Ernährung */,
                                                            )),
                                                        LegendEntry(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wed63zxu' /* Reisen */,
                                                            )),
                                                      ],
                                                      width: 100.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      textPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  10.0,
                                                                  5.0,
                                                                  0.0),
                                                      backgroundColor:
                                                          const Color(0x00FFFFFF),
                                                      borderWidth: 1.0,
                                                      borderColor:
                                                          const Color(0x002C7869),
                                                      indicatorSize: 10.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.isDataLoaded == true)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 244.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'zz7hm8en' /* Top 5 Co2-Verursacher (letzte ... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const DashboardBottomSheetWidget(
                                                                      isWeekly:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .expandAlt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (_model.weekyIsEmpty ==
                                                        false)
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final top5 = FFAppState()
                                                                .DashboardData
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.totalCO2weekly,
                                                                    desc: true)
                                                                .toList()
                                                                .take(5)
                                                                .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  top5.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      top5Index) {
                                                                final top5Item =
                                                                    top5[
                                                                        top5Index];
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            '${(top5Index + 1).toString()}.',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().ZutatenListe.where((e) => e.id == top5Item.itemID).toList().firstOrNull?.name,
                                                                              'Item',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${valueOrDefault<String>(
                                                                              formatNumber(
                                                                                top5Item.totalCO2weekly,
                                                                                formatType: FormatType.custom,
                                                                                format: '#.##',
                                                                                locale: '',
                                                                              ),
                                                                              '0',
                                                                            )} kg CO2e',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    if (_model.weekyIsEmpty ==
                                                        true)
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'v0kdyeps' /* In den letzten 7 Tagen wurden ... */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 0.0),
                                child: Container(
                                  width: 416.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'befpzpn0' /* Total CO2e heute:  */,
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
                                          valueOrDefault<String>(
                                            formatNumber(
                                              (_model.housingDaily!) +
                                                  (_model
                                                      .transportationDaily!) +
                                                  (_model.nutritionDaily!),
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
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '2nif2dby' /* kg */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: SizedBox(
                                            width: 370.0,
                                            height: 113.0,
                                            child: Stack(
                                              children: [
                                                FlutterFlowPieChart(
                                                  data: FFPieChartData(
                                                    values: [
                                                      _model.housingDaily!,
                                                      _model.nutritionDaily!,
                                                      _model
                                                          .transportationDaily!
                                                    ],
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent3
                                                    ],
                                                    radius: [80.0, 83.0, 86.0],
                                                  ),
                                                  donutHoleRadius: 0.0,
                                                  donutHoleColor:
                                                      Colors.transparent,
                                                  sectionLabelType:
                                                      PieChartSectionLabelType
                                                          .value,
                                                  sectionLabelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child:
                                                      FlutterFlowChartLegendWidget(
                                                    entries: [
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ied9g9jb' /* Wohnen, Energie & Konsum */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'qvie67ac' /* Ernährung */,
                                                          )),
                                                      LegendEntry(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'g2hli2k3' /* Reisen */,
                                                          )),
                                                    ],
                                                    width: 100.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 10.0,
                                                                5.0, 0.0),
                                                    backgroundColor:
                                                        const Color(0x00FFFFFF),
                                                    borderWidth: 1.0,
                                                    borderColor:
                                                        const Color(0x002C7869),
                                                    indicatorSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.isDataLoaded == true)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 244.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wfqs0otv' /* Top 5 Co2-Verursacher heute */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const DashboardBottomSheetWidget(
                                                                    isWeekly:
                                                                        false,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .expandAlt,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (_model.dailyIsEmpty ==
                                                      false)
                                                    Builder(
                                                      builder: (context) {
                                                        final top5 = FFAppState()
                                                            .DashboardData
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .totalCO2t0,
                                                                desc: true)
                                                            .toList()
                                                            .take(5)
                                                            .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              top5.length,
                                                          itemBuilder: (context,
                                                              top5Index) {
                                                            final top5Item =
                                                                top5[top5Index];
                                                            return Container(
                                                              width: 100.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      '${(top5Index + 1).toString()}.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .ZutatenListe
                                                                            .where((e) =>
                                                                                e.id ==
                                                                                top5Item.itemID)
                                                                            .toList()
                                                                            .firstOrNull
                                                                            ?.name,
                                                                        'Item',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          top5Item
                                                                              .totalCO2weekly,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#.##',
                                                                          locale:
                                                                              '',
                                                                        ),
                                                                        '0',
                                                                      )} kg CO2e',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  if (_model.dailyIsEmpty ==
                                                      true)
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'f167xwse' /* Für heute wurden noch keine Da... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                      },
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
