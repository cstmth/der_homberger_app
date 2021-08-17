import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:flutter/material.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
      title: "Startseite",
      showAdminDrawer: true,
      position: Position.ADMIN_HOME,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Momentan gibt es hier noch nichts zu sehen. Gutes Schaffen!"),
          ],
        ),
      ),
    );
  }
}
