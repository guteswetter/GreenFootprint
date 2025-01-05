import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'erfassen_widget.dart' show ErfassenWidget;
import 'package:flutter/material.dart';

class ErfassenModel extends FlutterFlowModel<ErfassenWidget> {
  ///  Local state fields for this page.

  List<int> zutatID = [82];
  void addToZutatID(int item) => zutatID.add(item);
  void removeFromZutatID(int item) => zutatID.remove(item);
  void removeAtIndexFromZutatID(int index) => zutatID.removeAt(index);
  void insertAtIndexInZutatID(int index, int item) =>
      zutatID.insert(index, item);
  void updateZutatIDAtIndex(int index, Function(int) updateFn) =>
      zutatID[index] = updateFn(zutatID[index]);

  List<double> menge = [80.0];
  void addToMenge(double item) => menge.add(item);
  void removeFromMenge(double item) => menge.remove(item);
  void removeAtIndexFromMenge(int index) => menge.removeAt(index);
  void insertAtIndexInMenge(int index, double item) =>
      menge.insert(index, item);
  void updateMengeAtIndex(int index, Function(double) updateFn) =>
      menge[index] = updateFn(menge[index]);

  int current = 0;

  int totalItems = 0;

  int mahlzeitID = 0;

  String? datum;

  int? entryID;

  double mengeAlt = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Request units metadata)] action in Erfassen widget.
  ApiCallResponse? getUnits;
  // Stores action output result for [Backend Call - API (Edit existing data in database by entry ID)] action in FloatingActionButton widget.
  ApiCallResponse? updateByEntryID;
  // Stores action output result for [Backend Call - API (addDaily)] action in FloatingActionButton widget.
  ApiCallResponse? getEntryID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
