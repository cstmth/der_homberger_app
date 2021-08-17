import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/ui/no_connection_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveScaffold extends StatelessWidget {
  final String title;
  final Position? navPosition;
  final ConnectionType connectionType;
  final Widget drawer;
  final Widget body;

  ResponsiveScaffold({required this.title, this.navPosition = Position.NONE, this.connectionType = ConnectionType.NONE, required this.drawer, required this.body});

  @override
  Widget build(BuildContext context) {
    HombergerAppBar appBar = HombergerAppBar(title: title);
    bool isMobile = MediaQuery.of(context).size.width <= Sizes.desktopWidth;

    updatePositionState(context);

    return Scaffold(
      // TODO Clean up
      appBar: isMobile ? appBar : null,
      drawer: isMobile ? drawer : null,
      body: isMobile
          ? Column(
              children: [
                NoConnectionBanner(connectionType),
                Expanded(child: body),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                drawer,
                Expanded(
                  child: Column(
                    children: [
                      appBar,
                      NoConnectionBanner(connectionType), // only shown when applicable
                      Expanded(child: body),
                    ],
                  ),
                )
              ],
            ),
    );
  }

  void updatePositionState(BuildContext context) {
    WidgetsBinding? instance = WidgetsBinding.instance;

    if (instance == null) {
      throw StateError("WidgetsBinding.instance was null. It is needed to update the NavPositionState which could not be updated therefore.");
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<NavPositionState>().position = navPosition;
    });
  }
}

class HombergerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HombergerAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= Sizes.desktopWidth;

    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: isMobile
          ? IconButton(
              icon: Icon(Icons.menu_rounded, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
          : null,
      title: Headline5(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
