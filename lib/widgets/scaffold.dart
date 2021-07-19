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
    HombergerAppBar appBar = HombergerAppBar(title: title);
    bool isMobile =
        MediaQuery.of(context).size.width <= Breakpoints.desktopWidth;

    return Scaffold(
      appBar: isMobile ? appBar : null,
      drawer: isMobile ? drawer : null,
      body: isMobile
          ? body
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                drawer,
                Expanded(
                  child: Column(
                    children: [
                      appBar,
                      Expanded(child: body),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class HombergerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HombergerAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width <= Breakpoints.desktopWidth;

    return Container(
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: isMobile
            ? IconButton(
                icon: Icon(Icons.menu_rounded, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : null,
        title: Headline5(title),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
