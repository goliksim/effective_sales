import 'dart:async';
import 'package:effective_sales/app/injectable_init.dart';
import 'package:effective_sales/app/localization/app_localizations.dart';
import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    logger.log('Starting app in main.dart');
    runApp(const EffectiveSaleApp());
  }, (error, stack) {
    logger.warning(error.toString());
  });
}

class EffectiveSaleApp extends StatelessWidget {
  const EffectiveSaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      theme: MyTheme.dark(),
      darkTheme: MyTheme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
    );
  }
}
