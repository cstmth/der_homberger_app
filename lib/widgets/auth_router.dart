import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/screens/admin/admin_overview_screen.dart';
import 'package:der_homberger_app/screens/shared/loading_screen.dart';
import 'package:der_homberger_app/screens/shared/password_screen.dart';
import 'package:der_homberger_app/screens/user/user_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthType? authType = Provider.of<AuthState>(context).authType;

    switch (authType) {
      case null:
        return LoadingScreen(text: "Prüfe Authentifizierung, bitte warten ...");
      case AuthType.USER:
        return UserOverviewScreen();
      case AuthType.ADMIN:
        return AdminOverviewScreen();
      case AuthType.NONE:
        return PasswordScreen();
    }
  }
}
