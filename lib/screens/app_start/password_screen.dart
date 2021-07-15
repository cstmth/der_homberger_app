import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool isUserLogin = true;
  bool isFirstTry = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    AuthenticationState authState = Provider.of<AuthenticationState>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: 768),
            child: Column(
              children: [
                Container(height: 48),
                Icon(
                  isUserLogin ? Icons.shield_rounded : Icons.lock_rounded,
                  size: 64,
                ),
                Container(height: 16),
                Headline4("Passwort eingeben"),
                Container(height: 32),
                BodyText1(
                  "Bitte gib das gültige Passwort ein. Das aktuelle Passwort kannst du in der Zentrale erfragen.",
                ),
                Container(height: 48),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Passwort",
                    errorText: isFirstTry ? null : "Das Passwort ist falsch!",
                  ),
                  controller: textController,
                  obscureText: true,
                ),
                // TODO Change from web check to MediaQuery check based on height
                kIsWeb ? Container(height: 128) : Expanded(child: Container()),
                TextButton(
                  onPressed: () {
                    authState.logInAsAdmin(textController.text);
                    setState(() {
                      isFirstTry = false;
                    });
                  },
                  child: Text("Als Administrator einloggen"),
                  style: Styles.textButtonStyle,
                ),
                Container(height: 8),
                ElevatedButton(
                  onPressed: () {
                    authState.logInAsAdmin(textController.text);
                    setState(() {
                      isFirstTry = false;
                    });
                  },
                  child: Text("Einloggen"),
                  style: Styles.bigButtonStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}