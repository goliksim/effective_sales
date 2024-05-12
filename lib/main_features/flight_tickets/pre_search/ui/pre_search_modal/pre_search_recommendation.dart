import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/bloc/flight_page_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_modal/pre_search_recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreSearchRecommendation extends StatelessWidget {
  const PreSearchRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightPageBloc, FlightPageState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (_, recommendations) => SizedBox(
            height: 216,
            child: Card(
              color: context.myColors.grey3,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) =>
                      PreSearchRecommendationItem(recommendation: recommendations[index])),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: recommendations.length,
                ),
              ),
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
