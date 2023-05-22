import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountControllerModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int count = 1;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - removeAmount] action in Icon widget.
  int? newAmountCopy2;
  // Stores action output result for [Backend Call - Update Row] action in Icon widget.
  List<CartsCollectionRow>? updatedCartRowCopy2;
  // Stores action output result for [Custom Action - addAmount] action in Icon widget.
  int? total;
  // Stores action output result for [Backend Call - Update Row] action in Icon widget.
  List<CartsCollectionRow>? updatedCartRowCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
