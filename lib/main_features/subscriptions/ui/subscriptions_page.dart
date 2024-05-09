import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.S.nav_title_subscriptions),
    );
  }
}
