import 'package:der_homberger_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ConnectingToFirebaseScreen extends StatelessWidget {
  const ConnectingToFirebaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(),
            ),
            Container(height: 32),
            BodyText1("Verbindung zum Server wird hergestellt, bitte warten...")
          ],
        ),
      ),
    );
  }
}
