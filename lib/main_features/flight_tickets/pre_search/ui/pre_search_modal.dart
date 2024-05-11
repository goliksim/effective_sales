import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/ui/modals/fixed_modal.dart';
import 'package:effective_sales/main_features/flight_tickets/common/ui/route_search_widget.dart';
import 'package:flutter/material.dart';

void showPreSearchModalWindow(BuildContext context) {
  showBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    //isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (ctx) {
      return const PreSearchModalWindow();
    },
  );
}

class PreSearchModalWindow extends StatelessWidget {
  const PreSearchModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return FixedModal(
      hasTouchLine: true,
      size: 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            RouteSearchWidget(
              elevation: 0,
              departureIcon: const Icon(EffectiveSalesIcons.plane2),
              arrivalIcon: const Icon(EffectiveSalesIcons.search),
              showClearArrivalButton: true,
              departureAction: () {},
              arrivalAction: () {},
            )
          ],
        ),
      ), //MediaQuery.of(context).size.height * 0.9,
    );
  }
}
