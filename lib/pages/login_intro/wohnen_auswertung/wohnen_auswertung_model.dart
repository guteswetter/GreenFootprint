import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wohnen_auswertung_widget.dart' show WohnenAuswertungWidget;
import 'package:flutter/material.dart';

class WohnenAuswertungModel extends FlutterFlowModel<WohnenAuswertungWidget> {
  ///  Local state fields for this page.

  double? housingCo2 = 0.0;

  double? energyCo2 = 0.0;

  double? consumptionCo2 = 182.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get lifestyle emissions for user)] action in WohnenAuswertung widget.
  ApiCallResponse? lifestyleEmissionsResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
