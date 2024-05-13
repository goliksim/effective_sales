import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/common/ui/shimmer_box.dart';
import 'package:flutter/material.dart';

class FlightPreSearchBodyShimmer extends StatelessWidget {
  const FlightPreSearchBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 282 - 60 + 23 + 42 + 24 + 51,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 26,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ShimerBox(
                    56,
                    double.infinity,
                    EdgeInsets.zero,
                    color: context.myColors.grey2,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: 2,
                ),
                ShimerBox(
                  50,
                  double.infinity,
                  const EdgeInsets.only(top: 8),
                  color: context.myColors.grey2,
                ),
                const SizedBox(
                  height: 6,
                ),
                const ShimerBox(23 + 42, double.infinity, EdgeInsets.only(top: 23)),
                const ShimerBox(24 + 51, double.infinity, EdgeInsets.only(top: 24)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
