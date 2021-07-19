import 'package:der_homberger_app/utility/constants.dart';
import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  final Widget body;

  const SimpleScreen({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: Breakpoints.desktopWidth),
            child: body,
          ),
        ),
      ),
    );
  }
}
