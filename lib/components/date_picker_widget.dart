import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    this.passedDate,
    this.useCase,
  });

  final String? passedDate;
  final String? useCase;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final datePickedDate = await showDatePicker(
          context: context,
          initialDate: getCurrentTimestamp,
          firstDate: DateTime(1900),
          lastDate: DateTime(2050),
          builder: (context, child) {
            return wrapInMaterialDatePickerTheme(
              context,
              child!,
              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
              headerForegroundColor: FlutterFlowTheme.of(context).info,
              headerTextStyle:
                  FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        fontSize: 32.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
              pickerBackgroundColor:
                  FlutterFlowTheme.of(context).secondaryBackground,
              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
              selectedDateTimeBackgroundColor:
                  FlutterFlowTheme.of(context).primary,
              selectedDateTimeForegroundColor:
                  FlutterFlowTheme.of(context).info,
              actionButtonForegroundColor:
                  FlutterFlowTheme.of(context).primaryText,
              iconSize: 24.0,
            );
          },
        );

        if (datePickedDate != null) {
          safeSetState(() {
            _model.datePicked = DateTime(
              datePickedDate.year,
              datePickedDate.month,
              datePickedDate.day,
            );
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 0.0, 12.0),
                child: Text(
                  valueOrDefault<String>(
                    () {
                      if (widget.passedDate != null &&
                          widget.passedDate != '') {
                        return widget.passedDate;
                      } else if (_model.datePicked != null) {
                        return dateTimeFormat(
                          "y-M-d",
                          _model.datePicked,
                          locale: FFLocalizations.of(context).languageCode,
                        );
                      } else {
                        return dateTimeFormat(
                          "y-M-d",
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        );
                      }
                    }(),
                    'Datum auswählen..',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Icon(
                Icons.calendar_month,
                color: FlutterFlowTheme.of(context).primary,
                size: 36.0,
              ),
            ),
          ].divide(const SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
