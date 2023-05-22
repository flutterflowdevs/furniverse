// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getNewAmount(
  int count,
  int totalAmount,
  int amount,
  int rowCount,
) async {
  // Add your function code here!
  print(count);
  print(totalAmount);
  print(amount);
  print(rowCount);
  // count--;

  // if(rowCount > count){
  // totalAmount -= amount * rowCount;
  // totalAmount += amount * count;
  // }else if(rowCount < count){
  //   totalAmount -= amount * rowCount;
  // totalAmount += amount * count;
  // }

  totalAmount -= amount * rowCount;
  totalAmount += amount * count;

  // totalAmount += amount * count;
  print(totalAmount);
  return totalAmount;
}
