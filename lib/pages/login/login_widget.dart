import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/password_widget.dart';
import '/components/username_email_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 328.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Lottie.asset(
                    'assets/jsons/Animation_-_1731845711065.json',
                    width: 0.0,
                    height: 352.0,
                    fit: BoxFit.fill,
                    frameRate: FrameRate(80.0),
                    animate: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                    height: 415.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 0.0, 20.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'voriaocg' /* Login */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.usernameEmailModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const UsernameEmailWidget(),
                                  ),
                                  wrapWithModel(
                                    model: _model.passwordModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const PasswordWidget(),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          17.0, 3.0, 17.0, 40.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              'https://mmp.pantek.app/users/forgot_password.php');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'lbac6rj2' /* Passwort vergessen? */,
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 75.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        _model.authResponse =
                                            await MeAndMyPlanetMockAPIGroup
                                                .userAuthorizationCall
                                                .call(
                                          loginType: 'local',
                                          userName: _model.usernameEmailModel
                                              .textController.text,
                                          credentials: _model.passwordModel
                                              .textController.text,
                                        );

                                        shouldSetState = true;
                                        if ((_model.authResponse?.succeeded ??
                                            true)) {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signIn(
                                            authenticationToken:
                                                MeAndMyPlanetMockAPIGroup
                                                    .userAuthorizationCall
                                                    .jwt(
                                              (_model.authResponse?.jsonBody ??
                                                  ''),
                                            ),
                                          );
                                          FFAppState().User = UserStruct(
                                            email: _model.usernameEmailModel
                                                .textController.text,
                                          );
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Logindaten ungültig',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  const Color(0x506B6666),
                                            ),
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }

                                        _model.groupInfo =
                                            await MeAndMyPlanetMockAPIGroup
                                                .requestInformationAboutTheGroupTheUserIsPartOfCall
                                                .call(
                                          bearerAuth:
                                              currentAuthenticationToken,
                                        );

                                        shouldSetState = true;
                                        if ((_model.groupInfo?.succeeded ??
                                            true)) {
                                          FFAppState().updateUserStruct(
                                            (e) => e
                                              ..updateGroupInfo(
                                                (e) => e
                                                  ..name = MeAndMyPlanetMockAPIGroup
                                                      .requestInformationAboutTheGroupTheUserIsPartOfCall
                                                      .name(
                                                    (_model.groupInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ..periodStart =
                                                      MeAndMyPlanetMockAPIGroup
                                                          .requestInformationAboutTheGroupTheUserIsPartOfCall
                                                          .periodStart(
                                                    (_model.groupInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ..periodEnd =
                                                      MeAndMyPlanetMockAPIGroup
                                                          .requestInformationAboutTheGroupTheUserIsPartOfCall
                                                          .periodEnd(
                                                    (_model.groupInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                              ),
                                          );
                                          safeSetState(() {});
                                        }
                                        _model.getUnitMetadata =
                                            await MeAndMyPlanetMockAPIGroup
                                                .requestUnitOptionsMetadataCall
                                                .call();

                                        shouldSetState = true;
                                        if ((_model
                                                .getUnitMetadata?.succeeded ??
                                            true)) {
                                          if ((FFAppState().Units.isNotEmpty) ==
                                              false) {
                                            FFAppState().Units = ((_model
                                                                .getUnitMetadata
                                                                ?.jsonBody ??
                                                            '')
                                                        .toList()
                                                        .map<UnitsSchemaStruct?>(
                                                            UnitsSchemaStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        UnitsSchemaStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<UnitsSchemaStruct>();
                                          }
                                        }
                                        if (FFAppState().InitialSetupDone ==
                                            true) {
                                          context.pushNamedAuth(
                                              'Dashboard', context.mounted);
                                        } else {
                                          if (FFAppState().User.displayName !=
                                                  '') {
                                            context.pushNamedAuth(
                                                'WillkommenUnvollstaendig',
                                                context.mounted);
                                          } else {
                                            context.pushNamedAuth(
                                                'Willkommen', context.mounted);
                                          }
                                        }

                                        _model.current = 0;
                                        _model.totalItems =
                                            FFAppState().Mahlzeiten.length;
                                        _model.deleteByIndexList = [];
                                        safeSetState(() {});
                                        FFAppState().GetLast7Days = functions
                                            .getLast7Days()
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        while (_model.current! <
                                            _model.totalItems!) {
                                          if ((FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(0)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(1)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(2)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(3)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(4)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(5)) &&
                                              (FFAppState()
                                                      .Mahlzeiten
                                                      .elementAtOrNull(
                                                          _model.current!)
                                                      ?.datum !=
                                                  FFAppState()
                                                      .GetLast7Days
                                                      .elementAtOrNull(6))) {
                                            _model.addToDeleteByIndexList(
                                                _model.current!);
                                            safeSetState(() {});
                                          }
                                          _model.current = _model.current! + 1;
                                          safeSetState(() {});
                                        }
                                        _model.current = 0;
                                        _model.totalItems =
                                            _model.deleteByIndexList.length;
                                        safeSetState(() {});
                                        if ((_model.deleteByIndexList
                                                .isNotEmpty) ==
                                            true) {
                                          while (_model.current! <
                                              _model.totalItems!) {
                                            FFAppState()
                                                .removeAtIndexFromMahlzeiten(
                                                    _model.deleteByIndexList
                                                        .lastOrNull!);
                                            safeSetState(() {});
                                            _model
                                                .removeAtIndexFromDeleteByIndexList(
                                                    _model.deleteByIndexList
                                                        .lastOrNull!);
                                            safeSetState(() {});
                                            _model.current =
                                                _model.current! + 1;
                                            safeSetState(() {});
                                          }
                                        }
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'r0ikytip' /* Login */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ciuvgeo7' /* Noch kein Konto?
 */
                                            ,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mmg3x53o' /* Hier registrieren */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await launchURL(
                                                  'https://mmp.pantek.app/users/join.php');
                                            },
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
