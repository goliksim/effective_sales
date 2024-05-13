import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/main_features/flight_tickets/common/bloc/route_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/arrival_recommendation_entity.dart';
import 'package:flutter/material.dart';

class PreSearchRecommendationItem extends StatelessWidget {
  const PreSearchRecommendationItem({
    super.key,
    required this.recommendation,
  });
  final ArrivalRecommendationEntity recommendation;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        context.routeSearchBloc?.confirmArrivalByString(recommendation.placeTitle, context);
      },
      child: SizedBox(
        height: 56,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    //TODO IMAGE MOCK (CHANGE TO IMAGE.NETWORK)
                    child: Image.asset(
                      fit: BoxFit.fitHeight,
                      width: 40,
                      height: 40,
                      recommendation.imageUrl,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recommendation.placeTitle,
                        style: context.myStyles.title3,
                      ),
                      Text(
                        recommendation.tag,
                        style: context.myStyles.text2.copyWith(
                          color: context.myColors.grey5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
