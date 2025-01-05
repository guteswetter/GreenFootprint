import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'zutat_model.dart';
export 'zutat_model.dart';

class ZutatWidget extends StatefulWidget {
  const ZutatWidget({super.key});

  @override
  State<ZutatWidget> createState() => _ZutatWidgetState();
}

class _ZutatWidgetState extends State<ZutatWidget> {
  late ZutatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZutatModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
