import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/router.dart';
import 'core/utils/utils.dart';

import './core/config/config.dart';
import 'services/app_localization_service.dart';

Future<void> main() async {
  await initConfig();
  runApp(const ProviderScope(child: FlutterTest()));
}

class FlutterTest extends StatelessWidget {
  const FlutterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colors.secondaryColor,
        appBarTheme: AppBarTheme(color: colors.primaryColor),
        primaryColor: colors.primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: colors.primaryColor),
      ),
      localizationsDelegates: const [
        AppLocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      localeResolutionCallback: localeCallback,
      routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
      routeInformationParser: GoRouterConfig.router.routeInformationParser,
      routerDelegate: GoRouterConfig.router.routerDelegate,
      scrollBehavior: AppScrollBehavior(),
    );
  }
}
