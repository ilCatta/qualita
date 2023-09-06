import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:qualita/router.dart';
import 'package:qualita/theme/theme.dart';

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  App({this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: Themes.light,
      dark: Themes.light,
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Qualita',
        showPerformanceOverlay: false,
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
