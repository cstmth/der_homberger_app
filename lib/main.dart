import 'package:der_homberger_app/screens/shared/error_screen.dart';
import 'package:der_homberger_app/screens/shared/loading_screen.dart';
import 'package:der_homberger_app/utility/constants.dart';
import 'package:der_homberger_app/widgets/auth_router.dart';
import 'package:der_homberger_app/widgets/multi_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return HombergerMultiProvider(
      child: MaterialApp(
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen(
                exception: snapshot.error,
                stacktrace: StackTrace.current,
                message: "Die Verbindung zum Server ist fehlgeschlagen. Sind Sie mit dem Internet verbunden?",
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return AuthRouter();
            } else {
              return LoadingScreen(text: "Verbindung zum Server herstellen, bitte warten ...");
            }
          },
        ),
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
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
