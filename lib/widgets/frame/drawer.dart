import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/screens/admin/admin_overview_screen.dart';
import 'package:der_homberger_app/screens/admin/collections/create_collection_screen.dart';
import 'package:der_homberger_app/screens/admin/documents/create_document_screen.dart';
import 'package:der_homberger_app/screens/shared/error_screen.dart';
import 'package:der_homberger_app/screens/shared/settings_screen.dart';
import 'package:der_homberger_app/screens/user/user_overview_screen.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/no_glow_scroll_behavior.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HombergerDrawer extends StatelessWidget {
  final bool isAdmin;

  const HombergerDrawer({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    List<Widget> title = [
      Container(height: 32),
      Center(child: Headline5("Der Homberger App")),
      Container(height: 32),
    ];

    List<Widget> drawerContent = [
      Placeholder()
    ];

    if (isAdmin) {
      drawerContent = [
        _DrawerTile(
          leading: Icons.home_rounded,
          text: "Startseite",
          destination: AdminOverviewScreen(),
          position: Position.ADMIN_HOME,
        ),
        Container(height: 24),
        _DrawerOverline("DOKUMENTE"),
        Container(height: 12),
        _DrawerTile(
          leading: Icons.add_rounded,
          text: "Erstellen",
          destination: CreateDocumentScreen(),
          position: Position.ADMIN_CREATE_DOCUMENT,
        ),
        _DrawerTile(
          leading: Icons.edit_rounded,
          text: "Verwalten",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.ADMIN_MANAGE_DOCUMENTS,
        ),
        Container(height: 24),
        _DrawerOverline("SAMMLUNGEN"),
        Container(height: 12),
        _DrawerTile(
          leading: Icons.add_rounded,
          text: "Erstellen",
          destination: CreateCollectionScreen(),
          position: Position.ADMIN_CREATE_COLLECTION,
        ),
        _DrawerTile(
          leading: Icons.directions_bus_rounded,
          text: "Verwalten",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.ADMIN_MANAGE_COLLECTIONS,
        ),
        Container(height: 24),
        _DrawerOverline("PASSWÖRTER ÄNDERN"),
        Container(height: 12),
        _DrawerTile(
          leading: Icons.person_rounded,
          text: "Nutzer",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.ADMIN_CHANGE_USER_PASSWORD,
        ),
        _DrawerTile(
          leading: Icons.shield_rounded,
          text: "Administrator",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.ADMIN_CHANGE_ADMIN_PASSWORD,
        ),
      ];
    } else {
      drawerContent = [
        _DrawerTile(
          leading: Icons.home_rounded,
          text: "Startseite",
          destination: UserOverviewScreen(),
          position: Position.USER_HOME,
        ),
        _DrawerTile(
          leading: Icons.directions_rounded,
          text: "DVG Betras",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_BETRAS,
        ),
        _DrawerTile(
          leading: Icons.warning_rounded,
          text: "DVG Anordnungen",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_ANORDNUNGEN,
        ),
        _DrawerTile(
          leading: Icons.departure_board_rounded,
          text: "DVG Wagenkarten",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_WAGENKARTEN,
        ),
        _DrawerTile(
          leading: Icons.dashboard_rounded,
          text: "Schwarzes Brett",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_SCHWARZES_BRETT,
        ),
        _DrawerTile(
          leading: Icons.mail_rounded,
          text: "Rundschreiben",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_RUNDSCHREIBEN,
        ),
        _DrawerTile(
          leading: Icons.explore_rounded,
          text: "DVG Dienstanweisung",
          destination: ErrorScreen(message: "Nicht implementiert"),
          position: Position.USER_DIENSTANWEISUNG,
        ),
      ];
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...title,
            ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView(
                shrinkWrap: true,
                children: drawerContent,
              ),
            ),
            Spacer(),
            Divider(),
            _DrawerTile(
              leading: Icons.settings_rounded,
              text: "Einstellungen",
              destination: SettingsScreen(),
            ),
            _DrawerTile(
              leading: Icons.logout_outlined,
              text: "Ausloggen",
              destination: Placeholder(),
              shallLogOut: true,
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerOverline extends StatelessWidget {
  final String text;

  const _DrawerOverline(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.drawerInset),
      child: Overline(text),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData leading;
  final String text;
  final Widget destination;
  final Position position;
  final bool shallLogOut;

  const _DrawerTile({
    required this.leading,
    required this.text,
    required this.destination,
    this.position = Position.NONE,
    this.shallLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    Position? currentPosition = context.watch<NavPositionState>().position;
    return InkWell(
      onTap: () {
        if (shallLogOut) {
          context.read<AuthState>().signOut(context, prompt: true);
          return;
        }

        Route route = MaterialPageRoute(builder: (BuildContext context) => destination);
        Future.microtask(() => Navigator.of(context).push(route));
      },
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Styles.smallBorderRadius,
              color: currentPosition == position ? AppColors.primaryWithAlpha : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (currentPosition == position) ...[
                    Icon(leading, color: AppColors.primary),
                    Container(width: 32),
                    Text(
                      text,
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                  if (currentPosition != position) ...[
                    Icon(leading),
                    Container(width: 32),
                    Text(text),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
