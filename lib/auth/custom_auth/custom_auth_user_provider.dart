import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class GreenFootprintAuthUser {
  GreenFootprintAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<GreenFootprintAuthUser> greenFootprintAuthUserSubject =
    BehaviorSubject.seeded(GreenFootprintAuthUser(loggedIn: false));
Stream<GreenFootprintAuthUser> greenFootprintAuthUserStream() =>
    greenFootprintAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
