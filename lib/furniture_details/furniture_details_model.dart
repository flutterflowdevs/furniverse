import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FurnitureDetailsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String selectedColor = 'Unknown';

  List<String> imgList = [];
  void addToImgList(String item) => imgList.add(item);
  void removeFromImgList(String item) => imgList.remove(item);
  void removeAtIndexFromImgList(int index) => imgList.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row] action in Icon widget.
  List<UsersRow>? newRow;
  // Stores action output result for [Backend Call - Update Row] action in Icon widget.
  List<UsersRow>? newRow1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
