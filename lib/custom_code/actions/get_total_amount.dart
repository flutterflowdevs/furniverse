// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getTotalAmount(List<CartsCollectionRow> cartRecord) async {
  // Add your function code here!

  int totalAmount = 0;
  for (int i = 0; i < cartRecord.length; i++) {
    print(cartRecord[i].amt);
    totalAmount += cartRecord[i].amt as int;
  }
  return totalAmount;
}
