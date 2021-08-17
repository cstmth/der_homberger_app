import 'package:der_homberger_app/utility/constants.dart';
import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  final Widget body;

  const SimpleScreen({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: Sizes.desktopWidth),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
