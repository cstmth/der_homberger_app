import 'package:flutter/material.dart';

class Strings {
  static const String appName = "Der Homberger App";

  static const String userEmail = "hombergeruser@carldressler.de";
  static const String adminEmail = "hombergeradmin@carldressler.de";
}

class AppColors {
  static const Color primary = Color(0xFFD93535);
  static const Color accent = Color(0xFF1E3A8E);

  static const Color darkGray = Color(0xFF555555);
  static const Color gray = Color(0xFFC4C4C4);
  static const Color lightGray = Color(0xFFF1F1F1);

  static Color primaryWithAlpha = primary.withAlpha(64);
  static Color accentWithAlpha = accent.withAlpha(64);
}

class Styles {
  static final ThemeData theme = ThemeData(
    dividerTheme: DividerThemeData(
      color: AppColors.darkGray,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16.0),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: bigBorderRadius,
      ),
      /*selected*/ border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.accent,
          width: 1,
        ),
        borderRadius: bigBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: bigBorderRadius,
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
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontFamily: "Lato",
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontFamily: "Lato",
        fontSize: 16,
      ),
      overline: TextStyle(
        fontFamily: "Lato",
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        fontFamily: "Lato",
        color: Colors.black,
        fontSize: 12,
      ),
    ),
  );

  static BorderRadius smallBorderRadius = BorderRadius.circular(6.0);
  static BorderRadius bigBorderRadius = BorderRadius.circular(12.0);
}

class Sizes {
  static const double desktopWidth = 1440.0;
  static const double desktopHeight = 768.0;
  static const double contentMaxWidth = 768.0;
  static const double drawerInset = 16.0;
  static const double complexScreenTopPadding = 16.0;
}

class HombergerIcons {
  static const Icon labelImportant = Icon(
    Icons.label_important_rounded,
    color: AppColors.accent,
  );

  static const Icon star = Icon(Icons.star_rounded, color: AppColors.primary);
}
