import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/ui/big_button.dart';
import 'package:flutter/material.dart';

class CreateDocumentScreen extends StatelessWidget {
  final TextEditingController documentNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  String dropdownCollectionText = "Sammlung auswählen";
  String dropdownDocumentTypeText = "Dokumenttyp auswählen";
  bool? simpleCollectionSelected;

  CreateDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
      title: "Dokument erstellen",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: Sizes.complexScreenTopPadding),
              Headline5("Dokument"),
              Container(height: 16.0),
              Row(
                children: [
                  HombergerIconButton(icon: Icon(Icons.upload_rounded), onPressed: () {}),
                  Container(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: documentNameController,
                      decoration: InputDecoration(labelText: "Name des Dokuments"),
                    ),
                  )
                ],
              ),
              Container(height: 16.0),
              TextField(
                controller: startDateController,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  labelText: "Gültig ab (für sofortige Gültigkeit leer lassen)",
                  suffixIcon: Icon(Icons.calendar_today_rounded),
                ),
              ),
              Container(height: 16.0),
              TextField(
                controller: endDateController,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  labelText: "Gültig bis (für keinen Ablauf leer lassen)",
                  suffixIcon: Icon(Icons.calendar_today_rounded),
                ),
              ),
              Container(height: 32.0),
              Headline5("Sammlung"),
              DropdownButton(
                icon: Text(dropdownCollectionText),
                items: <String>[
                  'A',
                  'B',
                  'C',
                  'D'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                    onTap: () => dropdownCollectionText = value,
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getContentBelowDropdown() {
    if (simpleCollectionSelected == null) return SizedBox.shrink();

    if (simpleCollectionSelected!) return Text("Da es sich bei der angegebenen Sammlung um eine simple Sammlung handelt, ist die Angabe der Art des Dokumentes nicht nötig.");

    return DropdownButton(
      icon: Text("Hallo bla bla bla"),
      items: <String>[
        'A',
        'B',
        'C',
        'D'
      ].map((String value) {
        return DropdownMenuItem<String>(
          
          value: value,
           
          child: new Text(value),
          onTap: () => dropdownDocumentTypeText = value,
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
