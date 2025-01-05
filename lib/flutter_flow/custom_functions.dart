import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

int? countItems(List<int>? list) {
  // i need a function which takes a list of integers as input and counts how many entries the list consists of
  int countItems(List<int> list) {
    return list.length;
  }
}

int filteredListLength(
  List<MahlzeitListeTotalStruct>? list,
  int? itemID,
  String? datum,
) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  return list
      .where((item) => item.itemID == itemID && item.datum == datum)
      .length;
}

int? getFilteredEntryID(
  int? itemID,
  String? datum,
  List<MahlzeitListeTotalStruct>? list,
) {
  if (list == null || list.isEmpty) {
    return null;
  }

  final defaultItem = MahlzeitListeTotalStruct(
    itemID: -1,
    datum: ' ',
    entryID: null,
    menge: null,
    mahlzeitID: null,
  );

  final filteredItem = list.firstWhere(
    (item) => item.itemID == itemID && item.datum == datum,
    orElse: () => defaultItem,
  );

  if (filteredItem.itemID == -1) {
    return null;
  }

  return filteredItem?.entryID;
}

double? getTotalMenge(
  int? itemID,
  String? datum,
  List<MahlzeitListeTotalStruct>? list,
) {
  if (list == null || list.isEmpty) {
    return 0.0; // Rückgabe 0.0, wenn die Liste leer oder null ist
  }

  return list
      .where((item) => item.itemID == itemID && item.datum == datum)
      .fold<double?>(0.0, (double? sum, item) {
    final menge = item.menge ?? 0.0; // Menge explizit sicherstellen
    return (sum ?? 0.0) + menge;
  });
}

int filteredListLengthByIdAndMahlzeitID(
  List<MahlzeitListeTotalStruct>? list,
  int? itemID,
  int? mahlzeitID,
) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  return list
      .where((item) => item.itemID == itemID && item.mahlzeitID == mahlzeitID)
      .length;
}

bool checkIfItemInList(
  int? itemID,
  List<MahlzeitListeStruct>? list,
) {
  if (list == null || list.isEmpty || itemID == null) {
    return false;
  }

  return list.any((item) => item.itemID == itemID);
}

int findIndexFromMahlzeit(
  List<MahlzeitListeTotalStruct>? mahlzeiten,
  int mahlzeitID,
  int itemID,
) {
  if (mahlzeiten == null) {
    return -1;
  }

  return mahlzeiten.indexWhere((item) =>
      (item.mahlzeitID ?? '') == mahlzeitID && (item.itemID ?? '') == itemID);
}

int findIndexFromDashboardList(
  List<DashboardSchemaStruct>? itemList,
  int itemID,
) {
  // null safety
  if (itemList == null) {
    return -1;
  }

  // index finden, der die bedingungen erfüllt
  return itemList.indexWhere((item) {
    return item.itemID == itemID;
  });
}

List<MahlzeitListeTotalStruct> filterByMengeAndID(
  List<MahlzeitListeTotalStruct>? mahlzeitenTotal,
  bool kategorieReise,
) {
  if (mahlzeitenTotal == null) {
    return [];
  }

  return mahlzeitenTotal.where((item) {
    if (item.menge <= 0) {
      return false;
    }

    if (kategorieReise) {
      return item.itemID <= 10;
    } else {
      return item.itemID > 10;
    }
  }).toList();
}

int findIndexFromReise(
  List<MahlzeitListeTotalStruct>? mahlzeiten,
  int mahlzeitID,
) {
  // null safety
  if (mahlzeiten == null) {
    return -1;
  }

  // index finden, der die bedingungen erfüllt
  return mahlzeiten.indexWhere((item) {
    return item.mahlzeitID == mahlzeitID;
  });
}

List<ZutatenSchemaStruct> loadPersistedZutatenListe(
    List<ZutatenSchemaStruct> persistedZutatenListe) {
  return List.from(persistedZutatenListe);
}

List<String> getLast7Days() {
  List<String> dates = [];
  DateTime today = DateTime.now();

  for (int i = 0; i < 7; i++) {
    DateTime date = today.subtract(Duration(days: i));
    String formattedDate = "${date.year}-${date.month}-${date.day}";
    dates.add(formattedDate);
  }

  return dates;
}

List<DashboardSchemaStruct>? calculateDashboardTotalPerItem(
    List<DashboardSchemaStruct>? items) {
  if (items == null) {
    return [];
  }

  for (var item in items) {
    double sum = 0.0;

    // Summiere die Werte von t0 bis t6
    sum += (item.t0 ?? 0);
    sum += (item.t1 ?? 0);
    sum += (item.t2 ?? 0);
    sum += (item.t3 ?? 0);
    sum += (item.t4 ?? 0);
    sum += (item.t5 ?? 0);
    sum += (item.t6 ?? 0);

    // Aktualisiere das Total-Feld
    item.totalMenge = sum;
  }

  return items;
}
