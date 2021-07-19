import 'package:der_homberger_app/widgets/text.dart';
import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  final Icon? leading;
  final String title;
  final String caption;
  final Icon trailing;
  final VoidCallback onPressed;

  const ListElement(
      {this.leading,
      required this.title,
      required this.caption,
      required this.trailing,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap: () {
        // Open the document
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            leading ?? Container(),
            leading != null ? Container(width: 16) : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText1(title),
                Container(height: 4),
                Overline(caption),
              ],
            ),
            Expanded(child: Container()),
            trailing,
            Container(width: 16)
          ],
        ),
      ),
    );
  }
}
