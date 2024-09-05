import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_skin_care_model.dart';
export 'onboarding_skin_care_model.dart';

class OnboardingSkinCareWidget extends StatefulWidget {
  const OnboardingSkinCareWidget({super.key});

  @override
  State<OnboardingSkinCareWidget> createState() =>
      _OnboardingSkinCareWidgetState();
}

class _OnboardingSkinCareWidgetState extends State<OnboardingSkinCareWidget> {
  late OnboardingSkinCareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingSkinCareModel());

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
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Specific Skin Problems',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 24.0, 0.0),
                  child: Text(
                    '4/6',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Figtree',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 870.0,
            ),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0),
                      child: Text(
                        'What are the specific skin issues you\'re facing?',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      FlutterFlowDropDown<String>(
                        multiSelectController:
                            _model.dropDownValueController ??=
                                FormListFieldController<String>(null),
                        options: [
                          'Acne/Pimples',
                          'Dark Spots/Marks',
                          'Acne Scars',
                          'Pigmentation',
                          'Sun Tanning',
                          'Dry Skin',
                          'Dull Skin',
                          'Under Eye Dark Circles',
                          'Aging/Wrinkles',
                          'Crow\'s Feet or Smile Lines'
                        ],
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Please select...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: true,
                        onMultiSelectChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'skin_concerns': _model.dropDownValue,
                            },
                          ),
                        });
                        if (currentUserDocument?.concern == UserConcern.Both) {
                          context.pushNamed('onboardingHairCare');
                        } else {
                          context.pushNamed('onboardingAnyOther');
                        }
                      },
                      text: 'Next',
                      options: FFButtonOptions(
                        width: 230.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Figtree',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
