// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double?> getCurrentAmount(
  List<dynamic>? jsonData,
  int? searchID,
) async {
  // given a json output, containing zero, one or multiple entries, delievered to the requested function by the param "jsonData". second parameter called "searchID", type integer. i need a function to search through this json data and look for the entry with same "id" as the specified parameter variable. the function should return the value from "amountNumeric" (double) of this entry

  double? amount;

  // Check if jsonData is not null and searchID is not null
  if (jsonData != null && searchID != null) {
    // Loop through each entry in jsonData
    for (var entry in jsonData) {
      // Check if the entry has an "id" field and it matches the searchID
      if (entry['id'] == searchID) {
        // Get the value from "amountNumeric" field and assign it to amount
        amount = entry['amountNumeric'];
        break; // Exit the loop once the entry is found
      }
    }
  }

  return amount;
}
