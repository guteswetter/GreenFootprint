import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  GreenFootprintAuthUser? initialUser;
  GreenFootprintAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(GreenFootprintAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Dashboard')
              : const NavBarPage(
                  initialPage: 'Dashboard',
                  page: DashboardWidget(),
                ),
        ),
        FFRoute(
          name: 'Wohnen2',
          path: '/wohnen2',
          requireAuth: true,
          builder: (context, params) => const Wohnen2Widget(),
        ),
        FFRoute(
          name: 'Wohnen1',
          path: '/wohnen1',
          requireAuth: true,
          builder: (context, params) => const Wohnen1Widget(),
        ),
        FFRoute(
          name: 'Wohnen3',
          path: '/wohnen3',
          requireAuth: true,
          builder: (context, params) => const Wohnen3Widget(),
        ),
        FFRoute(
          name: 'Willkommen',
          path: '/willkommen',
          requireAuth: true,
          builder: (context, params) => const WillkommenWidget(),
        ),
        FFRoute(
          name: 'WohnenAuswertung',
          path: '/wohnenAuswertung',
          requireAuth: true,
          builder: (context, params) => WohnenAuswertungWidget(
            housingCo2: params.getParam(
              'housingCo2',
              ParamType.double,
            ),
            energyCo2: params.getParam(
              'energyCo2',
              ParamType.double,
            ),
            consumptionCo2: params.getParam(
              'consumptionCo2',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'Willkommen4',
          path: '/willkommen4',
          requireAuth: true,
          builder: (context, params) => const Willkommen4Widget(),
        ),
        FFRoute(
          name: 'Profil',
          path: '/profil',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Profil')
              : const ProfilWidget(),
        ),
        FFRoute(
          name: 'Erfassen',
          path: '/erfassen',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Erfassen')
              : ErfassenWidget(
                  zutatID: params.getParam<int>(
                    'zutatID',
                    ParamType.int,
                    isList: true,
                  ),
                  zutatMenge: params.getParam<double>(
                    'zutatMenge',
                    ParamType.double,
                    isList: true,
                  ),
                ),
        ),
        FFRoute(
          name: 'MahlzeitUebersicht',
          path: '/mahlzeitUebersicht',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: MahlzeitUebersichtWidget(),
          ),
        ),
        FFRoute(
          name: 'MahlzeitZutatenAuswaehlenBackup',
          path: '/mahlzeitZutatenAuswaehlenBackup',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: MahlzeitZutatenAuswaehlenBackupWidget(),
          ),
        ),
        FFRoute(
          name: 'ReiseErfassen',
          path: '/reiseErfassen',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ReiseErfassenWidget(),
          ),
        ),
        FFRoute(
          name: 'ReiseUebersicht',
          path: '/reiseUebersicht',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ReiseUebersichtWidget(),
          ),
        ),
        FFRoute(
          name: 'ReiseFlugErfassen',
          path: '/reiseFlugErfassen',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ReiseFlugErfassenWidget(),
          ),
        ),
        FFRoute(
          name: 'FlugUebersicht',
          path: '/flugUebersicht',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: FlugUebersichtWidget(),
          ),
        ),
        FFRoute(
          name: 'ReiseBearbeiten',
          path: '/reiseBearbeiten',
          requireAuth: true,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ReiseBearbeitenWidget(
              entryID: params.getParam(
                'entryID',
                ParamType.int,
              ),
              itemID: params.getParam(
                'itemID',
                ParamType.int,
              ),
              menge: params.getParam(
                'menge',
                ParamType.double,
              ),
              date: params.getParam(
                'date',
                ParamType.String,
              ),
              mahlzeitID: params.getParam(
                'mahlzeitID',
                ParamType.int,
              ),
              index: params.getParam(
                'index',
                ParamType.int,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'Willkommen2',
          path: '/willkommen2',
          requireAuth: true,
          builder: (context, params) => const Willkommen2Widget(),
        ),
        FFRoute(
          name: 'WillkommenUnvollstaendig',
          path: '/willkommenUnvollstaendig',
          requireAuth: true,
          builder: (context, params) => const WillkommenUnvollstaendigWidget(),
        ),
        FFRoute(
          name: 'MahlzeitZutatenAuswaehlen',
          path: '/mahlzeitZutatenAuswaehlen',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: MahlzeitZutatenAuswaehlenWidget(),
          ),
        ),
        FFRoute(
          name: 'MahlzeitBearbeiten',
          path: '/mahlzeitBearbeiten',
          requireAuth: true,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MahlzeitBearbeitenWidget(
              mahlzeitID: params.getParam(
                'mahlzeitID',
                ParamType.int,
              ),
              date: params.getParam(
                'date',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'WohnenBearbeiten',
          path: '/wohnenBearbeiten',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: WohnenBearbeitenWidget(),
          ),
        ),
        FFRoute(
          name: 'ProfilResetOption',
          path: '/profilResetOption',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ProfilResetOptionWidget(),
          ),
        ),
        FFRoute(
          name: 'ProfilDatenschutz',
          path: '/profilDatenschutz',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ProfilDatenschutzWidget(),
          ),
        ),
        FFRoute(
          name: 'ProfilLoeschen',
          path: '/profilLoeschen',
          requireAuth: true,
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ProfilLoeschenWidget(),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
