import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bild_auswahl_model.dart';
export 'bild_auswahl_model.dart';

class BildAuswahlWidget extends StatefulWidget {
  const BildAuswahlWidget({
    super.key,
    this.parameter1,
    this.imageIndex,
  });

  final String? parameter1;
  final int? imageIndex;

  @override
  State<BildAuswahlWidget> createState() => _BildAuswahlWidgetState();
}

class _BildAuswahlWidgetState extends State<BildAuswahlWidget> {
  late BildAuswahlModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BildAuswahlModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: FFAppState().User.profilePicture == widget.parameter1
              ? FlutterFlowTheme.of(context).primary
              : const Color(0x00000000),
          width: FFAppState().User.profilePicture == widget.parameter1
              ? 2.0
              : 0.0,
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().selectedAvatarIndex = widget.imageIndex!;
          FFAppState().updateUserStruct(
            (e) => e..profilePicture = widget.parameter1,
          );
          safeSetState(() {});
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 500),
            imageUrl: widget.parameter1!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
