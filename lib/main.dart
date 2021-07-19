import 'package:der_homberger_app/providers/authentication_state.dart';
import 'package:der_homberger_app/providers/position_state.dart';
import 'package:der_homberger_app/screens/misc/error_screen.dart';
import 'package:der_homberger_app/screens/misc/loading_screen.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/authentication_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DerHombergerApp());
}

class DerHombergerApp extends StatefulWidget {
  const DerHombergerApp();

  @override
  _DerHombergerAppState createState() => _DerHombergerAppState();
}

class _DerHombergerAppState extends State<DerHombergerApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationState>(
      create: (context) => AuthenticationState(),
      child: MaterialApp(
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen(
                exception: snapshot.error,
                stacktrace: StackTrace.current,
                message:
                    "Die Verbindung zum Server ist fehlgeschlagen. Sind Sie mit dem Internet verbunden?",
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ChangeNotifierProvider(
                create: (context) => NavPositionState(),
                child: AuthenticationRouter(),
              );
            } else {
              return LoadingScreen(
                  text: "Verbindung zum Server herstellen, bitte warten ...");
            }
          },
        ),
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: Styles.theme,
        builder: (context, child) {
          if (child == null) return const SizedBox.shrink();

          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child,
          );
        },
      ),
    );
  }
}
