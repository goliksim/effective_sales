import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:flutter/material.dart';

class FlightSearchHotDeal extends StatelessWidget {
  const FlightSearchHotDeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          context.S.f_pre_search_hints_hot_tickets,
        ),
      ),
    );
  }
}
