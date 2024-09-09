import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_modal/create_modal_widget.dart';
import '/components/empty_list_1/empty_list1_widget.dart';
import '/components/web_components/post_modal_view/post_modal_view_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'main_feed_model.dart';
export 'main_feed_model.dart';

class MainFeedWidget extends StatefulWidget {
  const MainFeedWidget({
    super.key,
    this.userRef,
  });

  final String? userRef;

  @override
  State<MainFeedWidget> createState() => _MainFeedWidgetState();
}

class _MainFeedWidgetState extends State<MainFeedWidget>
    with TickerProviderStateMixin {
  late MainFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered1 = false;
  var hasIconTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'main_Feed'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: Visibility(
        visible: MediaQuery.sizeOf(context).width <= 990.0,
        child: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('MAIN_FEED_FloatingActionButton_5f9epi1d_');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed('createPost');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Welcome back 👋🏻',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.userName, ''),
                                'User!',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MAIN_FEED_PAGE_Image_ofry2cu2_ON_TAP');
                              logFirebaseEvent('Image_navigate_to');

                              context.pushNamed('main_Profile');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(44.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: currentUserPhoto,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
              elevation: 0.0,
            )
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => safeSetState(() {}),
            child: SideNavWidget(
              selectedNav: 1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1070.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MAIN_FEED_PAGE_NEW_POST_BTN_ON_TAP');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Color(0x00000000),
                                      barrierColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: CreateModalWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'New Post',
                                  icon: Icon(
                                    Icons.mode_edit,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 44.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: StreamBuilder<List<UserPostsRecord>>(
                          stream: queryUserPostsRecord(
                            queryBuilder: (userPostsRecord) => userPostsRecord
                                .orderBy('timePosted', descending: true),
                            limit: 50,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserPostsRecord>
                                socialFeedUserPostsRecordList = snapshot.data!;
                            if (socialFeedUserPostsRecordList.isEmpty) {
                              return Center(
                                child: Container(
                                  width: 330.0,
                                  height: 330.0,
                                  child: EmptyList1Widget(),
                                ),
                              );
                            }

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    socialFeedUserPostsRecordList.length,
                                    (socialFeedIndex) {
                                  final socialFeedUserPostsRecord =
                                      socialFeedUserPostsRecordList[
                                          socialFeedIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          socialFeedUserPostsRecord.postUser!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final userPostUsersRecord =
                                            snapshot.data!;

                                        return Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            constraints: BoxConstraints(
                                              maxWidth: 670.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'MAIN_FEED_PAGE_Column_da753bdz_ON_TAP');
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width >=
                                                        1271.0) {
                                                      logFirebaseEvent(
                                                          'Column_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                PostModalViewWidget(
                                                              postRef:
                                                                  socialFeedUserPostsRecord,
                                                              userRef:
                                                                  userPostUsersRecord,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Column_navigate_to');

                                                      context.pushNamed(
                                                        'postDetails_Page',
                                                        queryParameters: {
                                                          'userRecord':
                                                              serializeParam(
                                                            userPostUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'postReference':
                                                              serializeParam(
                                                            socialFeedUserPostsRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userRecord':
                                                              userPostUsersRecord,
                                                          'postReference':
                                                              socialFeedUserPostsRecord,
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_FEED_PAGE_Image_ntkd2234_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Image_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'viewProfilePageOther',
                                                                      queryParameters:
                                                                          {
                                                                        'userDetails':
                                                                            serializeParam(
                                                                          userPostUsersRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'userDetails':
                                                                            userPostUsersRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            44.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          userPostUsersRecord
                                                                              .photoUrl,
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                userPostUsersRecord
                                                                    .userName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      if (socialFeedUserPostsRecord
                                                                  .postPhoto !=
                                                              null &&
                                                          socialFeedUserPostsRecord
                                                                  .postPhoto !=
                                                              '')
                                                        FlutterFlowMediaDisplay(
                                                          path:
                                                              socialFeedUserPostsRecord
                                                                  .postPhoto,
                                                          imageBuilder: (path) =>
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        0),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        0),
                                                            imageUrl: path,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 150.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          videoPlayerBuilder:
                                                              (path) =>
                                                                  FlutterFlowVideoPlayer(
                                                            path: path,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            autoPlay: false,
                                                            looping: false,
                                                            showControls: false,
                                                            allowFullScreen:
                                                                true,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: Text(
                                                                  key: ValueKey(
                                                                      'I prefer to stay within 80 characters (79, actually, to avoid spurious line breaks when I am using, eg, an xterm window) with 4-character indents.'),
                                                                  valueOrDefault<
                                                                      String>(
                                                                    socialFeedUserPostsRecord
                                                                        .postDescription,
                                                                    'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        100,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            41.0,
                                                                        height:
                                                                            41.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (!socialFeedUserPostsRecord.likes.contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_FEED_PAGE_unselected_ON_TAP');
                                                                                    logFirebaseEvent('unselected_backend_call');

                                                                                    await socialFeedUserPostsRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'likes': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    logFirebaseEvent('unselected_widget_animation');
                                                                                    if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
                                                                                      safeSetState(() => hasIconTriggered1 = true);
                                                                                      SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['iconOnActionTriggerAnimation1']!.controller.forward(from: 0.0));
                                                                                    }
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.favorite_border,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 25.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (socialFeedUserPostsRecord.likes.contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_FEED_PAGE_selected_ON_TAP');
                                                                                    logFirebaseEvent('selected_backend_call');

                                                                                    await socialFeedUserPostsRecord.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'likes': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.favorite_rounded,
                                                                                    color: valueOrDefault<Color>(
                                                                                      socialFeedUserPostsRecord.likes.isNotEmpty ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryBackground,
                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    size: 25.0,
                                                                                  ),
                                                                                ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation1']!, hasBeenTriggered: hasIconTriggered1),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.likes(socialFeedUserPostsRecord).toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Figtree',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 41.0,
                                                                  height: 41.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      if (socialFeedUserPostsRecord
                                                                              .numComments <=
                                                                          0)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('MAIN_FEED_PAGE_unselected_ON_TAP');
                                                                              logFirebaseEvent('unselected_backend_call');

                                                                              await socialFeedUserPostsRecord.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'likes': FieldValue.arrayUnion([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              logFirebaseEvent('unselected_widget_animation');
                                                                              if (animationsMap['iconOnActionTriggerAnimation2'] != null) {
                                                                                safeSetState(() => hasIconTriggered2 = true);
                                                                                SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['iconOnActionTriggerAnimation2']!.controller.forward(from: 0.0));
                                                                              }
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.mode_comment_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 25.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (socialFeedUserPostsRecord
                                                                              .numComments >
                                                                          0)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('MAIN_FEED_PAGE_selected_ON_TAP');
                                                                              logFirebaseEvent('selected_backend_call');

                                                                              await socialFeedUserPostsRecord.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'likes': FieldValue.arrayRemove([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.mode_comment,
                                                                              color: socialFeedUserPostsRecord.numComments > 0 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 25.0,
                                                                            ),
                                                                          ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation2']!, hasBeenTriggered: hasIconTriggered2),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        socialFeedUserPostsRecord
                                                                            .numComments
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Figtree',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        "relative",
                                                                        socialFeedUserPostsRecord
                                                                            .timePosted!),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_FEED_PAGE_Icon_47arfj6h_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_share');
                                                                      await Share
                                                                          .share(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          'Found this helpful tip on Duuet that I think you’ll love! 🌟 Here’s a quick snippet:${'\n'}${socialFeedUserPostsRecord.postDescription}${'\n'}Want more personalized skin and hair care tips like this? Join me on Duuet, India’s leading community for all things skin and hair care. Connect, learn, and share!',
                                                                          'Found this helpful tip on Duuet that I think you’ll love! 🌟 ',
                                                                        ),
                                                                        sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .ios_share,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation']!),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
