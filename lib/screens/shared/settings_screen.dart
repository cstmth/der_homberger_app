import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/ui/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
        title: "Einstellungen",
        position: Position.SETTINGS,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Overline("Problembehandlung"),
            ),
            HombergerListTile(
              title: "Cache leeren",
              caption: "Dies kann Fehler mit dem Zwischenspeicher beheben",
              onPressed: () => FirebaseFirestore.instance.clearPersistence(),
            ),
            HombergerListTile(
              title: "Ausloggen",
              caption: "Sie benötigen das Passwort, um sich erneut einzuloggen!",
              onPressed: () => context.read<AuthState>().signOut(context),
            )
          ],
        ));
  }
}
