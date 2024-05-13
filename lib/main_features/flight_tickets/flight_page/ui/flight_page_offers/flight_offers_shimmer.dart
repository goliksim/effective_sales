import 'package:effective_sales/common/ui/shimmer_box.dart';
import 'package:flutter/material.dart';

class FlightOffersShimmer extends StatelessWidget {
  const FlightOffersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    //context.flightPageBloc?.load();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 36, 12, 0),
        child: SizedBox(
          height: 264,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimerBox(50, 250, EdgeInsets.fromLTRB(8, 8, 8, 18)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: 213.16,
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const SizedBox(
                      width: 132,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimerBox(132, double.infinity, EdgeInsets.zero),
                          ShimerBox(24, 108, EdgeInsets.only(top: 8)),
                          ShimerBox(24, 74, EdgeInsets.only(top: 8)),
                          ShimerBox(24, double.infinity, EdgeInsets.only(top: 8)),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(width: 67),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
