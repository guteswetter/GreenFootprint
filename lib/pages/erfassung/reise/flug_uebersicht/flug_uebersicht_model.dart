import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flug_uebersicht_widget.dart' show FlugUebersichtWidget;
import 'package:flutter/material.dart';

class FlugUebersichtModel extends FlutterFlowModel<FlugUebersichtWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (List all flights for this user)] action in FlugUebersicht widget.
  ApiCallResponse? getFlights;
  // Stores action output result for [Backend Call - API (Remove flight from database)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultje3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
