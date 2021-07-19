import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  AuthType? authType;
  bool passwordWasWrong = false;

  AuthenticationState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      print("Auth change");
      print(event?.email);
      switch (event?.email) {
        case Constants.userEmail:
          authType = AuthType.USER;
          break;
        case Constants.adminEmail:
          authType = AuthType.ADMIN;
          break;
        default:
          authType = AuthType.NONE;
      }

      notifyListeners();
    });
  }

  void logInAsUser(String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Constants.userEmail,
        password: "Carli2907", // TODO Remove before release
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
        password: "Carli2907", // TODO Remove before release
      );
    } on FirebaseAuthException catch (error) {
      print(error);
      if (error.code == "wrong-password") {
        passwordWasWrong = true;
        notifyListeners();
      }
    }
  }
}

enum AuthType { NONE, USER, ADMIN }
