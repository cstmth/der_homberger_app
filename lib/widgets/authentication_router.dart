import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/screens/admin/admin_overview_screen.dart';
import 'package:der_homberger_app/screens/app_start/password_screen.dart';
import 'package:der_homberger_app/screens/user/user_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationRouter extends StatelessWidget {
  const AuthenticationRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthType authType = Provider.of<AuthenticationState>(context).authType;

    switch (authType) {
      case AuthType.user:
        return UserOverviewScreen();
      case AuthType.admin:
        return AdminOverviewScreen();
      case AuthType.none:
        return PasswordScreen();
    }
  }
}
