import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.S.nav_title_hotels),
    );
  }
}
