import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.blue.shade200);
var kColorSchemeDark = ColorScheme.fromSeed(
    seedColor: Colors.indigo.shade900, brightness: Brightness.dark);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(
      MaterialApp(
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorSchemeLight,
            appBarTheme: const AppBarTheme()
                .copyWith(backgroundColor: kColorSchemeLight.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kColorSchemeLight.primaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorSchemeLight.primaryContainer))),
        darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kColorSchemeDark,
            appBarTheme: const AppBarTheme()
                .copyWith(backgroundColor: kColorSchemeDark.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kColorSchemeDark.primaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorSchemeDark.primaryContainer))),
        themeMode: ThemeMode.system,
        home: const Expenses(),
      ),
    );
  });
}
