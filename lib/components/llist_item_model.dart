import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LlistItemModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getListOfImages] action in Container widget.
  List<String>? imList;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Stores action output result for [Backend Call - Update Row] action in Container widget.
  List<UsersRow>? newRow;
  // Stores action output result for [Backend Call - Update Row] action in Container widget.
  List<UsersRow>? newRow1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
