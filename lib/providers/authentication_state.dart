import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  AuthType? authType;
  bool passwordWasWrong = false;

  AuthState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      switch (event?.email) {
        case Strings.userEmail:
          print("Auth: User authenticated as USER");
          authType = AuthType.USER;
          break;
        case Strings.adminEmail:
          print("Auth: User authenticated as ADMIN");
          authType = AuthType.ADMIN;
          break;
        default:
          print("Auth: User logged out or is not logged in");
          authType = AuthType.NONE;
      }

      notifyListeners();
    });
  }

  void logInAsUser(String password) async {
    authType = AuthType.USER;
    notifyListeners();

    /*
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Strings.userEmail,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == "wrong-password") {
        passwordWasWrong = true;
        notifyListeners();
      }
    }
    */
  }

  void logInAsAdmin(String password) async {
    authType = AuthType.ADMIN;
    notifyListeners();

    /*
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Strings.adminEmail,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      print(error);
      if (error.code == "wrong-password") {
        passwordWasWrong = true;
        notifyListeners();
      }
    }
    */
  }

  void signOut(BuildContext context, {bool prompt = true}) {
    if (prompt) {
      // TODO Logout prompt implementieren
    }

    print("Logging out...");
    FirebaseAuth.instance.signOut();
  }
}

enum AuthType { NONE, USER, ADMIN }
