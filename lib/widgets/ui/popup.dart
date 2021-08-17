import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:flutter/material.dart';

class HombergerDialog extends StatelessWidget {
  final String title;
  final String text;

  final String acceptName;
  final String declineName;
  final String cancelName;

  /// Accentuated option
  final VoidCallback? accept;
  final VoidCallback? decline;
  final VoidCallback? cancel;

  const HombergerDialog({required this.title, required this.text, this.acceptName = "Ja", this.declineName = "Nein", this.cancelName = "Abbrechen", this.accept, this.decline, this.cancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Headline6(title),
          Text(text),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
