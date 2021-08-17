import 'package:der_homberger_app/firebase/firebase_admin.dart';
import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:der_homberger_app/widgets/ui/big_button.dart';
import 'package:flutter/material.dart';

class CreateCollectionScreen extends StatefulWidget {
  const CreateCollectionScreen();

  @override
  _CreateCollectionScreenState createState() => _CreateCollectionScreenState();
}

class _CreateCollectionScreenState extends State<CreateCollectionScreen> {
  TextEditingController textController = TextEditingController(); // TOD Sorgt für "inactive InputConnection" Warnung

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
      title: "Sammlung erstellen",
      showAdminDrawer: true,
      position: Position.ADMIN_CREATE_COLLECTION,
      connectionType: ConnectionType.POST,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Du erstellst gerade eine komplexe Sammlung (eine “Linie”). Das Erstellen von simplen Sammlungen ist (ironischerweise) nicht über die Oberfläche möglich."),
            Container(height: 48),
            TextField(
              decoration: InputDecoration(
                labelText: "Name der Sammlung",
              ),
              controller: textController,
            ),
            Container(height: 48),
            HombergerTextButton(
              isAccent: true,
              onPressed: () => FirebaseAdmin.createCollection(context, textController.text),
              child: Text("Sammlung erstellen"),
            ),
          ],
        ),
      ),
    );
  }
}
