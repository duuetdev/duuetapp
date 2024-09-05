import '/backend/backend.dart';
import '/components/empty_list_others_concerns/empty_list_others_concerns_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'others_conditions_page_model.dart';
export 'others_conditions_page_model.dart';

class OthersConditionsPageWidget extends StatefulWidget {
  const OthersConditionsPageWidget({
    super.key,
    required this.userRef,
  });

  final UsersRecord? userRef;

  @override
  State<OthersConditionsPageWidget> createState() =>
      _OthersConditionsPageWidgetState();
}

class _OthersConditionsPageWidgetState extends State<OthersConditionsPageWidget>
    with TickerProviderStateMixin {
  late OthersConditionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OthersConditionsPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Personal Concerns',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      isScrollable: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Figtree',
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).accent1,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      elevation: 0.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      buttonMargin:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 0.0),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      tabs: [
                        Tab(
                          text: 'Skin',
                        ),
                        Tab(
                          text: 'Hair',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Concerns',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final skinConcernsList =
                                      widget!.userRef?.skinConcerns?.toList() ??
                                          [];
                                  if (skinConcernsList.isEmpty) {
                                    return Center(
                                      child: EmptyListOthersConcernsWidget(),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: skinConcernsList.length,
                                    itemBuilder:
                                        (context, skinConcernsListIndex) {
                                      final skinConcernsListItem =
                                          skinConcernsList[
                                              skinConcernsListIndex];
                                      return ListTile(
                                        title: Text(
                                          valueOrDefault<String>(
                                            skinConcernsListItem,
                                            'Nil',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 12.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Concerns',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final hairConcerns =
                                      widget!.userRef?.hairConcerns?.toList() ??
                                          [];
                                  if (hairConcerns.isEmpty) {
                                    return Center(
                                      child: EmptyListOthersConcernsWidget(),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: hairConcerns.length,
                                    itemBuilder: (context, hairConcernsIndex) {
                                      final hairConcernsItem =
                                          hairConcerns[hairConcernsIndex];
                                      return ListTile(
                                        title: Text(
                                          valueOrDefault<String>(
                                            hairConcernsItem,
                                            'Nil',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 12.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
