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
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
