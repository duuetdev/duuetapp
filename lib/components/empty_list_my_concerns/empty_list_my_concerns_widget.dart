import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_my_concerns_model.dart';
export 'empty_list_my_concerns_model.dart';

class EmptyListMyConcernsWidget extends StatefulWidget {
  const EmptyListMyConcernsWidget({super.key});

  @override
  State<EmptyListMyConcernsWidget> createState() =>
      _EmptyListMyConcernsWidgetState();
}

class _EmptyListMyConcernsWidgetState extends State<EmptyListMyConcernsWidget> {
  late EmptyListMyConcernsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListMyConcernsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.medical_services,
          color: FlutterFlowTheme.of(context).primary,
          size: 90.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Text(
            'No Concerns',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
          child: Text(
            'It seems you have no concerns!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Figtree',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
