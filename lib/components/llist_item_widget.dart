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
import 'llist_item_model.dart';
export 'llist_item_model.dart';

class LlistItemWidget extends StatefulWidget {
  const LlistItemWidget({
    Key? key,
    this.furnitureData,
  }) : super(key: key);

  final FurnituresRow? furnitureData;

  @override
  _LlistItemWidgetState createState() => _LlistItemWidgetState();
}

class _LlistItemWidgetState extends State<LlistItemWidget> {
  late LlistItemModel _model;

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LlistItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<SubcollectionFurnitureRow>>(
      future: SubcollectionFurnitureTable().querySingleRow(
        queryFn: (q) => q.eq(
          'furniture_id',
          widget.furnitureData?.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<SubcollectionFurnitureRow> containerSubcollectionFurnitureRowList =
            snapshot.data!;
        final containerSubcollectionFurnitureRow =
            containerSubcollectionFurnitureRowList.isNotEmpty
                ? containerSubcollectionFurnitureRowList.first
                : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.imList = await actions.getListOfImages(
                        containerSubcollectionFurnitureRow!.clrImage.toList(),
                      );

                      context.pushNamed(
                        'FurnitureDetails',
                        queryParams: {
                          'furnitureData': serializeParam(
                            widget.furnitureData,
                            ParamType.SupabaseRow,
                          ),
                          'firstclrName': serializeParam(
                            containerSubcollectionFurnitureRow?.clrName,
                            ParamType.String,
                          ),
                          'firstImg': serializeParam(
                            _model.imList,
                            ParamType.String,
                            true,
                          ),
                        }.withoutNulls,
                      );

                      setState(() {});
                    },
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: FutureBuilder<List<SubcollectionFurnitureRow>>(
                        future: SubcollectionFurnitureTable().queryRows(
                          queryFn: (q) => q.eq(
                            'furniture_id',
                            widget.furnitureData?.id,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<SubcollectionFurnitureRow>
                              pageViewSubcollectionFurnitureRowList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              0,
                                              pageViewSubcollectionFurnitureRowList
                                                      .length -
                                                  1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      pageViewSubcollectionFurnitureRowList
                                          .length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewSubcollectionFurnitureRow =
                                        pageViewSubcollectionFurnitureRowList[
                                            pageViewIndex];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        functions.getImage(
                                            pageViewSubcollectionFurnitureRow
                                                .clrImage.first),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.75),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewSubcollectionFurnitureRowList
                                                        .length -
                                                    1)),
                                    count: pageViewSubcollectionFurnitureRowList
                                        .length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8.0,
                                      radius: 16.0,
                                      dotWidth: 5.0,
                                      dotHeight: 5.0,
                                      dotColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      activeDotColor: Colors.white,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                    child: FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'auth_id',
                          currentUserUid,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<UsersRow> rowUsersRowList = snapshot.data!;
                        final rowUsersRow = rowUsersRowList.isNotEmpty
                            ? rowUsersRowList.first
                            : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (!rowUsersRow!.isFavorite
                                .contains(widget.furnitureData?.id?.toString()))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.newRow = await UsersTable().update(
                                    data: {
                                      'is_favorite':
                                          functions.convertIntToStringList(
                                              rowUsersRow!.isFavorite.toList(),
                                              widget.furnitureData!.id),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'auth_id',
                                      currentUserUid,
                                    ),
                                    returnRows: true,
                                  );
                                  FFAppState().update(() {});

                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            if (rowUsersRow?.isFavorite?.contains(
                                    widget.furnitureData?.id?.toString()) ??
                                true)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.newRow1 = await UsersTable().update(
                                    data: {
                                      'is_favorite':
                                          functions.convertIntToStringListCopy(
                                              rowUsersRow!.isFavorite.toList(),
                                              widget.furnitureData!.id),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'auth_id',
                                      currentUserUid,
                                    ),
                                    returnRows: true,
                                  );
                                  FFAppState().update(() {});

                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Icon(
                                    Icons.favorite_sharp,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Text(
                              widget.furnitureData!.furnitureName!,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lufga',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: Text(
                      '\$ ${widget.furnitureData?.furniturePrice?.toString()}',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lufga',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
