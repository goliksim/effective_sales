import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_offers_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/arrival_recommendation_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/arrival_recommendation_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'flight_page_bloc.freezed.dart';
part 'flight_page_events.dart';
part 'flight_page_states.dart';

extension FlightPageBuilder on BuildContext {
  FlightPageState? get flightpageState => BlocProvider.of<FlightPageBloc>(this).state;
  FlightPageBloc? get flightPageBloc => BlocProvider.of<FlightPageBloc>(this);
}

@singleton
class FlightPageBloc extends Bloc<FlightPageEvent, FlightPageState> {
  final FlightOffersRepository flightOffersRep;
  final ArrivalRecommendationRepository arrivalRecommendationRep;

  FlightPageBloc(
    this.flightOffersRep,
    this.arrivalRecommendationRep,
  ) : super(const FlightPageState.init()) {
    on<_LoadFlightPage>(_load);
  }

  void load() {
    add(const FlightPageEvent.load());
  }

  Future<void> _load(_LoadFlightPage event, Emitter<FlightPageState> emit) async {
    try {
      logger.log('flighPageBloc load');
      final flightOffers = await flightOffersRep.getOfferEntities();
      final arrivalRecommendations = await arrivalRecommendationRep.getAllRecommendation();
      logger.log('flightOffers $flightOffers');
      if (flightOffers.isEmpty) {
        emit(
          const FlightPageState.empty(),
        );
      } else {
        emit(
          FlightPageState.loaded(
            flightOffers,
            arrivalRecommendations,
          ),
        );
      }
    } catch (e) {
      logger.warning('flighPageBloc error $e');
      emit(
        const FlightPageState.error(),
      );
    }
  }
}
