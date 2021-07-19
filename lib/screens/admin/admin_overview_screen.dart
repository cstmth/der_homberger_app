import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: Text("Log out"),
      ),
    );
  }
}
