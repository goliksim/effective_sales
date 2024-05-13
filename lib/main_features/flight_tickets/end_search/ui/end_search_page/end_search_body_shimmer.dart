import 'package:effective_sales/common/ui/shimmer_box.dart';
import 'package:flutter/material.dart';

class FlightSearchBodyShimmer extends StatelessWidget {
  const FlightSearchBodyShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const ShimerBox(
          100,
          double.infinity,
          EdgeInsets.zero,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 36,
        ),
        itemCount: 6,
      ),
    );
  }
}
