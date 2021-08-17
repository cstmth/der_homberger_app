import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/screen_types/simple_screen.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/ui/big_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthState>();

    return SimpleScreen(
      body: Column(
        children: [
          Icon(
            Icons.shield_rounded,
            size: 64,
          ),
          Container(height: 16),
          Headline4("Passwort eingeben"),
          Container(height: 32),
          Text(
            "Bitte gib das gültige Passwort ein. Das aktuelle Passwort kannst du in der Zentrale erfragen.",
          ),
          Container(height: 48),
          TextField(
            decoration: InputDecoration(
              labelText: "Passwort",
              errorText: authState.passwordWasWrong ? "Das Passwort ist falsch!" : null,
            ),
            controller: textController,
            obscureText: true,
          ),
          MediaQuery.of(context).size.height > Sizes.desktopHeight ? Container(height: 128) : Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HombergerTextButton(
                onPressed: () {
                  authState.logInAsAdmin(textController.text);
                },
                child: Text("Als Administrator einloggen"),
              ),
              Container(height: 8),
              HombergerTextButton(
                isAccent: true,
                onPressed: () {
                  authState.logInAsUser(textController.text);
                },
                child: Text("Einloggen"),
              )
            ],
          )
        ],
      ),
    );
  }
}
