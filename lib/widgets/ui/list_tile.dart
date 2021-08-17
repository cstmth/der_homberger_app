import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:flutter/material.dart';

class HombergerListTile extends StatelessWidget {
  final Icon? leading;
  final String title;
  final String caption;
  final Icon? trailing;
  final VoidCallback onPressed;

  const HombergerListTile({this.leading, required this.title, required this.caption, this.trailing, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        borderRadius: Styles.smallBorderRadius,
        onTap: () {
          // Open the document
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              leading ?? SizedBox.shrink(),
              leading != null ? Container(width: 16.0) : SizedBox.shrink(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headline6(title),
                    Container(height: 4),
                    Text(caption),
                  ],
                ),
              ),
              trailing != null ? Container(width: 16.0) : SizedBox.shrink(),
              trailing ?? SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
