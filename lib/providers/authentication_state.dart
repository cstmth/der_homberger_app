import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  AuthType authType = AuthType.none;

  AuthenticationState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      switch (event!.email) {
        case Constants.userEmail:
          authType = AuthType.user;
          break;
        case Constants.adminEmail:
          authType = AuthType.admin;
          break;
        default:
          authType = AuthType.none;
      }
      
      notifyListeners();
    });

    FirebaseAuth.instance.signOut();
  }

  void logInAsUser(String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Constants.userEmail,
      password: password,
    );
  }

  void logInAsAdmin(String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Constants.userEmail,
      password: password,
    );
  }
}

enum AuthType { none, user, admin }
