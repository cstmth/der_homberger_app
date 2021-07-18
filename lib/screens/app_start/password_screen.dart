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
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    AuthenticationState authState =
        Provider.of<AuthenticationState>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: Breakpoints.contentMaxWidth),
            child: Column(
              children: [
                Container(height: 48),
                Icon(
                  Icons.shield_rounded,
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
                    errorText: authState.passwordWasWrong
                        ? "Das Passwort ist falsch!"
                        : null,
                  ),
                  controller: textController,
                  obscureText: true,
                ),
                MediaQuery.of(context).size.height > Breakpoints.desktopHeight
                    ? Container(height: 128)
                    : Expanded(child: Container()),
                TextButton(
                  onPressed: () {
                    authState.logInAsAdmin(textController.text);
                  },
                  child: Text("Als Administrator einloggen"),
                  style: Styles.textButtonStyle,
                ),
                Container(height: 8),
                ElevatedButton(
                  onPressed: () {
                    authState.logInAsUser(textController.text);
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
