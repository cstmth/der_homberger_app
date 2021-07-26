import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'text.dart';

/// Papas ganzer Stolz
class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget drawer;

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

class HombergerDrawer extends StatelessWidget {
  final bool isAdmin;

  const HombergerDrawer({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    NavPosition? pos = Provider.of<NavPositionState>(context).currentPosition;
    List<Widget> drawerContent = isAdmin
        // Admin drawer
        ? [
            Headline5("Der Homberger App"),
            Container(height: 32),
            DrawerElement(
              leading: Icons.home_rounded,
              text: "Startseite",
              selected: pos == NavPosition.ADMIN_HOME,
            ),
            Container(height: 24),
            Overline("DOKUMENTE"),
            Container(height: 12),
            DrawerElement(
              leading: Icons.add_rounded,
              text: "Erstellen",
              selected: pos == NavPosition.ADMIN_CREATE_DOCUMENT,
            ),
            DrawerElement(
              leading: Icons.edit_rounded,
              text: "Verwalten",
              selected: pos == NavPosition.ADMIN_MANAGE_DOCUMENTS,
            ),
            Container(height: 24),
            Overline("SAMMLUNGEN"),
            Container(height: 12),
            DrawerElement(
              leading: Icons.add_rounded,
              text: "Erstellen",
              selected: pos == NavPosition.ADMIN_CREATE_COLLECTION,
            ),
            DrawerElement(
              leading: Icons.directions_bus_rounded,
              text: "Verwalten",
              selected: pos == NavPosition.ADMIN_MANAGE_COLLECTIONS,
            ),
            Container(height: 24),
            Overline("PASSWÖRTER ÄNDERN"),
            Container(height: 12),
            DrawerElement(
              leading: Icons.person_rounded,
              text: "Nutzer",
              selected: pos == NavPosition.ADMIN_CHANGE_USER_PASSWORD,
            ),
            DrawerElement(
              leading: Icons.shield_rounded,
              text: "Administrator",
              selected: pos == NavPosition.ADMIN_CHANGE_ADMIN_PASSWORD,
            ),
          ]
        // User drawer
        : [
            Headline5("Der Homberger App"),
            Container(height: 32),
            DrawerElement(
              leading: Icons.home_rounded,
              text: "Startseite",
              selected: pos == NavPosition.USER_UEBERSICHT,
            ),
            DrawerElement(
              leading: Icons.directions_rounded,
              text: "DVG Betras",
              selected: pos == NavPosition.USER_BETRAS,
            ),
            DrawerElement(
              leading: Icons.warning_rounded,
              text: "DVG Anordnungen",
              selected: pos == NavPosition.USER_ANORDNUNGEN,
            ),
            DrawerElement(
              leading: Icons.departure_board_rounded,
              text: "DVG Wagenkarten",
              selected: pos == NavPosition.USER_WAGENKARTEN,
            ),
            DrawerElement(
              leading: Icons.dashboard_rounded,
              text: "Schwarzes Brett",
              selected: pos == NavPosition.USER_SCHWARZES_BRETT,
            ),
            DrawerElement(
              leading: Icons.mail_rounded,
              text: "Rundschreiben",
              selected: pos == NavPosition.USER_RUNDSCHREIBEN,
            ),
            DrawerElement(
              leading: Icons.explore_rounded,
              text: "DVG Dienstanweisung",
              selected: pos == NavPosition.USER_DIENSTANWEISUNG,
            ),
          ];

    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: drawerContent,
        ),
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  final IconData leading;
  final String text;
  final Route? destination;
  final bool selected;

  const DrawerElement(
      {required this.leading,
      required this.text,
      this.destination,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          selected
              ? Icon(leading, color: Constants.primaryColor)
              : Icon(leading),
          Container(width: 32),
          selected
              ? BodyText1(text, color: Constants.primaryColor)
              : BodyText1(text),
        ],
      ),
    );
  }
}
