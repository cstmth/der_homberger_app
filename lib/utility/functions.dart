import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/screens/admin/admin_overview_screen.dart';
import 'package:der_homberger_app/screens/user/user_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Functions {
  static void bringHome(BuildContext context) {
    AuthType? authType = Provider.of<AuthState>(context, listen: false).authType;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => authType == AuthType.USER ? UserOverviewScreen() : AdminOverviewScreen(),
      ),
      (route) => false,
    );
  }

  static void pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
