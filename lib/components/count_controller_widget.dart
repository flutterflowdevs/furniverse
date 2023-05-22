import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'count_controller_model.dart';
export 'count_controller_model.dart';

class CountControllerWidget extends StatefulWidget {
  const CountControllerWidget({
    Key? key,
    required this.amount,
    this.favId,
    this.count,
    this.cartId,
  }) : super(key: key);

  final int? amount;
  final int? favId;
  final int? count;
  final int? cartId;

  @override
  _CountControllerWidgetState createState() => _CountControllerWidgetState();
}

class _CountControllerWidgetState extends State<CountControllerWidget> {
  late CountControllerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountControllerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 130.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.newAmountCopy2 = await actions.removeAmount(
                      FFAppState().totalAmount,
                      widget.amount!,
                      _model.count,
                    );
                    if (_model.count > 1) {
                      setState(() {
                        _model.count = _model.count + -1;
                      });
                      _model.updatedCartRowCopy2 =
                          await CartsCollectionTable().update(
                        data: {
                          'count': _model.count,
                        },
                        matchingRows: (rows) => rows.eq(
                          'id',
                          widget.favId,
                        ),
                        returnRows: true,
                      );
                      FFAppState().update(() {
                        FFAppState().totalAmount = _model.newAmountCopy2!;
                      });
                    }

                    setState(() {});
                  },
                  child: Icon(
                    Icons.remove_sharp,
                    color: FlutterFlowTheme.of(context).error,
                    size: 24.0,
                  ),
                ),
                Text(
                  _model.count.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lufga',
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.total = await actions.addAmount(
                      FFAppState().totalAmount,
                      widget.amount!,
                    );
                    setState(() {
                      _model.count = _model.count + 1;
                    });
                    _model.updatedCartRowCopy =
                        await CartsCollectionTable().update(
                      data: {
                        'count': _model.count,
                      },
                      matchingRows: (rows) => rows.eq(
                        'id',
                        widget.favId,
                      ),
                      returnRows: true,
                    );
                    FFAppState().update(() {
                      FFAppState().totalAmount = _model.total!;
                    });

                    setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
