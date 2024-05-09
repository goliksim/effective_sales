import 'package:effective_sales/app/localization/app_localizations.dart';
import 'package:flutter/material.dart';

extension Localization on BuildContext {
  AppLocalizations get S => AppLocalizations.of(this);
}