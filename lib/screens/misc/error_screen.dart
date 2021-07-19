import 'package:der_homberger_app/widgets/text.dart';
import 'package:der_homberger_app/widgets/screens/simple_screen.dart';
import 'package:flutter/material.dart';

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
          Container(height: 48),
          Icon(
            Icons.warning_rounded,
            size: 64,
          ),
          Container(height: 16),
          Headline4("Kritischer Fehler"),
          Container(height: 32),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: "Folgender Fehler ist aufgetreten: "),
                TextSpan(
                    text: "$message ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
          Container(height: 48),
          BodyText1(
              "Bitte melden Sie diesen Fehler in Kombination mit den Fehlerinformationen Cathrin. So helfen Sie dabei, den Fehler schnellstmöglich zu beheben."),
          Container(height: 16),
          Monospace("""
                $exception
                StackTrace: $stacktrace
              """)
        ],
      ),
    );
  }
}
