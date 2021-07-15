import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/screens/app_start/password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationRouter extends StatelessWidget {
  const AuthenticationRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<AuthenticationState>(context).isLoggedIn;

    if (isLoggedIn) {
      return ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: null,
      );
    } else {
      return PasswordScreen();
    }
  }
}
