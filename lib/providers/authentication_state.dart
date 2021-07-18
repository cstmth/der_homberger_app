import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  AuthType authType = AuthType.none;
  bool passwordWasWrong = false;

  AuthenticationState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      print("Auth change");
      print(event?.email);
      switch (event?.email) {
        case Constants.userEmail:
          authType = AuthType.user;
          break;
        case Constants.adminEmail:
          authType = AuthType.admin;
          break;
        case null:
          authType = AuthType.none;
      }

      notifyListeners();
    });
  }

  void logInAsUser(String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Constants.userEmail,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == "wrong-password") {
        passwordWasWrong = true;
        notifyListeners();
      }
    }
  }

  void logInAsAdmin(String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Constants.adminEmail,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == "wrong-password") {
        passwordWasWrong = true;
        notifyListeners();
      }
    }
  }
}

enum AuthType { none, user, admin }
