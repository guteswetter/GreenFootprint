import '/components/zutat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'zutaten_liste_model.dart';
export 'zutaten_liste_model.dart';

class ZutatenListeWidget extends StatefulWidget {
  const ZutatenListeWidget({
    super.key,
    required this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final int? parameter1;
  final int? parameter2;
  final String? parameter3;

  @override
  State<ZutatenListeWidget> createState() => _ZutatenListeWidgetState();
}

class _ZutatenListeWidgetState extends State<ZutatenListeWidget> {
  late ZutatenListeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZutatenListeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.zutatModel,
      updateCallback: () => safeSetState(() {}),
      child: const ZutatWidget(),
    );
  }
}
