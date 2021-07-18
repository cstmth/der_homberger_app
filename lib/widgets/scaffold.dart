import 'package:der_homberger_app/utility/constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Drawer drawer;

  const ResponsiveScaffold(
      {required this.title, required this.drawer, required this.body});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Breakpoints.desktopWidth) {
            // TODO Gar kein Bock
            return body;
          } else {
            return Scaffold(
              body: body,
              appBar: HombergerAppBar(title: "Beispiel"),
              drawer: drawer,
              drawerEnableOpenDragGesture: true,
              drawerEdgeDragWidth: constraints.maxWidth / 4,
            );
          }
        },
      ),
    );
  }
}

class HombergerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HombergerAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu_rounded, color: Colors.black),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: Headline5(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
