import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/screen_types/complex_screen.dart';
import 'package:der_homberger_app/widgets/text_wrappers.dart';
import 'package:der_homberger_app/widgets/ui/big_button.dart';
import 'package:der_homberger_app/widgets/ui/list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserOverviewScreen extends StatelessWidget {
  const UserOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComplexScreen(
      title: "Übersicht",
      position: Position.USER_HOME,
      connectionType: ConnectionType.GET,
      child: Column(
        children: [
          Headline3("Hervorgehobene Dokumente"),
          Container(height: 32),
          HombergerListTile(
            leading: HombergerIcons.labelImportant,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.labelImportant,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.labelImportant,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          Container(height: 48),
          Headline3("Angepinnte Dokumente"),
          Container(height: 32),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerTextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("Log out"),
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
          HombergerListTile(
            leading: HombergerIcons.star,
            title: "Name des Dokuments",
            caption: "Lorem ipsum dolor sit amet ...",
            trailing: Icon(Icons.chevron_right_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
