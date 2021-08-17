import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/utility/functions.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/screen_types/simple_screen.dart';
import 'package:der_homberger_app/widgets/ui/big_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorScreen extends StatelessWidget {
  final Object? exception;
  final StackTrace? stacktrace;
  final String? message;

  const ErrorScreen({this.exception, this.stacktrace, this.message});

  @override
  Widget build(BuildContext context) {
    return SimpleScreen(
      body: Column(
        children: [
          Icon(
            Icons.warning_rounded,
            size: 64,
          ),
          Container(height: 16),
          Headline4("Kritischer Fehler"),
          Container(height: 16),
          Text("Bitte melden Sie diesen Fehler in Kombination mit den Fehlerinformationen Cathrin. So helfen Sie dabei, den Fehler schnellstmöglich zu beheben."),
          Container(height: 32),
          Monospace("$exception\n$stacktrace"),
          Container(height: 32),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: HombergerTextButton(
                      onPressed: () => context.read<AuthState>().signOut(context),
                      child: Text("Ausloggen"),
                    ),
                  ),
                  Container(width: 16),
                  Expanded(
                    child: HombergerTextButton(
                      onPressed: () => Functions.bringHome(context),
                      child: Text("Zur Startseite"),
                    ),
                  ),
                ],
              ),
              Container(height: 16),
              HombergerTextButton(
                isAccent: true,
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Zurück"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
