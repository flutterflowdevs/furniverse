import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_a_r_page_model.dart';
export 'view_a_r_page_model.dart';

class ViewARPageWidget extends StatefulWidget {
  const ViewARPageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  _ViewARPageWidgetState createState() => _ViewARPageWidgetState();
}

class _ViewARPageWidgetState extends State<ViewARPageWidget> {
  late ViewARPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewARPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: custom_widgets.ArView(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.92,
                    image: widget.image!,
                    buyButtonOnClick: () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
