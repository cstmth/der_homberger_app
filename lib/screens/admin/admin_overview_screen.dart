import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/widgets/responsive_scaffold.dart';
import 'package:der_homberger_app/widgets/screens/complex_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
      title: "Startseite",
      isAdminScreen: true,
      child: ListView(
        children: [
          TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text("Log out"))
        ],
      ),
    );
  }
}
