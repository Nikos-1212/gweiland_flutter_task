import 'package:gweiland_flutter_task/utils/common_exports.dart';

@immutable
class AppConstants {
  const AppConstants._();
  static const String internFamilyReg = 'Inter-Regular';
  static const String internFamilyBold = 'Inter-Bold';
  static const String internFamilyMedium = 'Inter-Medium';
  static const String internFamilyLight = 'Inter-Light';

  // Colors for theme
  static const Color lightPrimary = Color(0xffFFFFFF);
  static const Color darkPrimary = Color(0xFF0B0B0B);
  static const Color lightAccent = Color(0xffFFFFFF);
  static const Color darkAccent = Color(0xFF0B0B0B);
  static const Color lightBG = lightPrimary;
  static const Color darkBG = Color(0xFF2B2B2B);
  static const Color lightgrey = Color.fromRGBO(11, 11, 11, 0.05);

  static const Color green = Color(0xff00CE08);
  static const Color red = Color(0xffFF3D00);
  static const Color yellow = Color(0xffFAE24C);
  static const List<Color> btnBorderGradient = [
    Color(0x4D00CE08),
    Color(0x8000CE08),
  ];

  static Color grey = lightAccent.withOpacity(0.4);

  static ThemeData lightTheme = ThemeData(
    // textTheme: const TextTheme(bodyText1: TextStyle(color: lightBG),bodyText2: TextStyle(color: darkBG) ),
    fontFamily: internFamilyReg,
    primaryColor: lightPrimary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
      color: lightBG,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: lightBG,
      iconTheme: IconThemeData(color: Colors.black),

      // toolbarTextStyle: GoogleFonts.nunito(
      //   color: Colors.black,
      //   fontSize: 20.0,
      //   fontWeight: FontWeight.w700,
      // ),
      // titleTextStyle: GoogleFonts.nunito(
      //   color: Colors.black,
      //   fontSize: 20.0,
      //   fontWeight: FontWeight.w700,
      // ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: lightBG,
      brightness: Brightness.light,
    ).copyWith(
      secondary: lightAccent,
      background: lightBG,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: internFamilyReg,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: darkBG,
      iconTheme: IconThemeData(color: Colors.white),
      // toolbarTextStyle: GoogleFonts.nunito(
      //   color: Colors.white,
      //   fontSize: 20.0,
      //   fontWeight: FontWeight.w700,
      // ),
      // titleTextStyle: GoogleFonts.nunito(
      //   color: Colors.white,
      //   fontSize: 20.0,
      //   fontWeight: FontWeight.w700,
      // ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: darkAccent,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: darkAccent,
      background: darkBG,
    ),
  );

  static List<T> map<T>(List list, Function(int, dynamic) handler) {
    final List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
