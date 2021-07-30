import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  AuthType? authType;
  bool passwordWasWrong = false;

  AuthenticationState() {
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    FirebaseAuth.instance.authStateChanges().listen((event) {
      switch (event?.email) {
        case Constants.userEmail:
          print("Auth: User authenticated as USER");
          authType = AuthType.USER;
          break;
        case Constants.adminEmail:
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
