import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/text.dart';
import 'package:der_homberger_app/widgets/list_element.dart';
import 'package:der_homberger_app/widgets/responsive_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserOverviewScreen extends StatelessWidget {
  const UserOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      title: "Übersicht",
      drawer: HombergerDrawer(isAdmin: true),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: BoxConstraints(maxWidth: Breakpoints.contentMaxWidth),
            child: ListView(
              children: [
                Headline3("Hervorgehobene Dokumente"),
                Container(height: 32),
                Column(
                  children: [
                    ListElement(
                      leading: HombergerIcons.labelImportant,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                    ListElement(
                      leading: HombergerIcons.labelImportant,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                    ListElement(
                      leading: HombergerIcons.labelImportant,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(height: 48),
                Headline3("Angepinnte Dokumente"),
                Container(height: 32),
                Column(
                  children: [
                    ListElement(
                      leading: HombergerIcons.star,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                    ListElement(
                      leading: HombergerIcons.star,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                    ListElement(
                      leading: HombergerIcons.star,
                      title: "Name des Dokuments",
                      caption: "Lorem ipsum dolor sit amet ...",
                      trailing: Icon(Icons.chevron_right_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Log out"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
