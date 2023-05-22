import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String getImage(String imgSTR) {
  return imgSTR;
}

List<String> convertIntToStringListCopy(
  List<String> userFavList,
  int favId,
) {
  print(userFavList);

  if (userFavList.contains(favId.toString())) {
    userFavList.remove(favId.toString());
  }
  print(userFavList);
  return userFavList;
}

List<String> convertIntToStringList(
  List<String> userFavList,
  int favId,
) {
  print(userFavList);

  if (!userFavList.contains(favId.toString())) {
    userFavList.add(favId.toString());
  }
  print(userFavList);
  return userFavList;
}

int getInt(String favId) {
  return int.parse(favId);
}

bool? isUserCartIsEmpty(CartsCollectionRow? record) {
  print("isUserCartIsEmpty" + (record == null).toString());
  if (record == null) {
    return true;
  }
  print("2. " + ((record!.count == null)).toString());
  if (record!.count == null) {
    return true;
  }
  print("3. " + ((record!.count! < 1)).toString());
  return record!.count! < 1;
}
