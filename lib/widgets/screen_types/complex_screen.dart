import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/frame/drawer.dart';
import 'package:der_homberger_app/widgets/frame/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class ComplexScreen extends StatelessWidget {
  final String title;
  final bool showAdminDrawer;
  final Position position;
  final ConnectionType connectionType;
  final Widget child;

  const ComplexScreen({
    required this.title,
    this.showAdminDrawer = false,
    this.position = Position.NONE,
    this.connectionType = ConnectionType.NONE,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: title,
      navPosition: position,
      connectionType: connectionType,
      drawer: HombergerDrawer(isAdmin: showAdminDrawer),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: Sizes.contentMaxWidth),
            child: ListView(
              children: [
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ConnectionType { GET, POST, BOTH, NONE }
