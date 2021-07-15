import 'package:der_homberger_app/utility/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends ChangeNotifier {
  bool isLoggedIn = false;

  AuthenticationState() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      print("Auth change");

      isLoggedIn = event != null;
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
