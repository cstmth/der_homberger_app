import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class ComplexScreen extends StatelessWidget {
  final String title;
  final bool isAdminScreen;
  final Widget child;

  const ComplexScreen(
      {required this.title, required this.isAdminScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: title,
      drawer: HombergerDrawer(isAdmin: isAdminScreen),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: Breakpoints.contentMaxWidth),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
