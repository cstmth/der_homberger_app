import 'package:flutter/material.dart';

class Constants {
  static const String appName = "Der Homberger App";

  static const String userEmail = "hombergeruser@carldressler.de";
  static const String adminEmail = "hombergeradmin@carldressler.de";

  static const Color primaryColor = Color(0xFFD93535);
  static const Color accentColor = Color(0xFF1E3A8E);

  static const Color darkGray = Color(0xFF555555);
  static const Color gray = Color(0xFFC4C4C4);
  static const Color lightGray = Color(0xFFF1F1F1);
}

class Styles {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Constants.primaryColor,
    dividerColor: Constants.lightGray,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Constants.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
        headline3: TextStyle(
          color: Colors.black,
          fontFamily: "Poppins",
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        headline4: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontFamily: "Poppins",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontFamily: "Lato",
          fontSize: 16,
        ),
        caption: TextStyle(
          fontFamily: "Lato",
          fontSize: 12,
        )),
  );

  static final ButtonStyle bigButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Constants.primaryColor),
    fixedSize: MaterialStateProperty.all(Size(1024, 48)),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    )),
  );

  static final textButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black),
    overlayColor: MaterialStateProperty.all(Colors.black.withAlpha(64)),
    padding: MaterialStateProperty.all(EdgeInsets.all(16)),
  );
}

class Breakpoints {
  static const double desktopWidth = 1440;
  static const double desktopHeight = 768;
  static const double contentMaxWidth = 768;
}

class HombergerIcons {
  static const Icon labelImportant = Icon(
    Icons.label_important_rounded,
    color: Constants.accentColor,
  );

  static const Icon star =
      Icon(Icons.star_rounded, color: Constants.primaryColor);
}
