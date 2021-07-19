import 'package:der_homberger_app/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String text;

  const LoadingScreen({this.text = "Bitte warten ..."});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Container(height: 32),
              BodyText1(text),
            ],
          ),
        ),
      ),
    );
  }
}
