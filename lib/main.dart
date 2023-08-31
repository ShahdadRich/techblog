import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/view/main_screen.dart';
import 'package:tech_blog/component/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: solidColor.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColor.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // locail kardn Farsi app
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // farsi
        ],
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(width: 5),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(fontSize: 30);
                  }
                  return const TextStyle(fontSize: 15);
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return solidColor.iconMiceColor;
                  }
                  return solidColor.primryColor;
                },
              ),
            ),
          ),
          fontFamily: 'dana',
          brightness: Brightness.light,
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: solidColor.postertitel),
              titleMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: solidColor.posterSubtitel,
              ),
              displayMedium: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              displaySmall: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 53, 53, 53)),
              headlineMedium: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  color: solidColor.titelList,
                  fontWeight: FontWeight.w700),
              headlineSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: solidColor.hintText,
              ),
              bodyLarge: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 13,
                  color: Color.fromARGB(255, 16, 16, 16),
                  fontWeight: FontWeight.w700)),
          useMaterial3: true,
        ),
        home: MainScreen());
  }
}
