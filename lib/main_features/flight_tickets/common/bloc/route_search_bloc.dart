import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_departure_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'route_search_bloc.freezed.dart';
part 'route_search_events.dart';
part 'route_search_states.dart';

extension RouteSearchBuilder on BuildContext {
  RouteSearchState? get routeSearchState => BlocProvider.of<RouteSearchBloc>(this).state;
  RouteSearchBloc? get routeSearchBloc => BlocProvider.of<RouteSearchBloc>(this);
}

@singleton
class RouteSearchBloc extends Bloc<RouteSearchEvent, RouteSearchState> {
  final FlightDepartureRepository flightDepartureRepository;

  RouteSearchBloc(
    this.flightDepartureRepository,
  ) : super(
          const RouteSearchState.init(
            flightRoute: FlightRoute(
              departure: null,
              arrival: null,
            ),
          ),
        ) {
    on<_LoadRouteSearch>(_load);
    on<_ArrivalStringConfirm>(_confirmArrivalByString);
    on<_DepartureStringConfirm>(_confirmDepartureByString);
    on<_SwapRouteSearch>(_swap);
    on<_ClearArrivalRouteSearch>(_clearArrival);
  }

  void load() {
    add(const RouteSearchEvent.load());
  }

  void confirmArrivalByString(String newArrival, BuildContext? context) {
    add(RouteSearchEvent.confirmArrivalByString(newArrival, context));
  }

  void confirmDepartureByString(String newDeparture) {
    add(RouteSearchEvent.confirmDepartureByString(newDeparture));
  }

  void swap() {
    add(const RouteSearchEvent.swap());
  }

  void clearArrival() {
    add(const RouteSearchEvent.clearArrival());
  }

  Future<void> _load(_LoadRouteSearch event, Emitter<RouteSearchState> emit) async {
    try {
      logger.log('Loading departure route part');
      final routeDeparture = await flightDepartureRepository.getLastDeparture();

      emit(
        RouteSearchState.loaded(flightRoute: FlightRoute(departure: routeDeparture, arrival: null)),
      );
    } catch (e) {
      logger.warning('Loading departure failed');
      emit(
        const RouteSearchState.loaded(flightRoute: FlightRoute(departure: null, arrival: null)),
      );
    }
  }

  Future<void> _confirmArrivalByString(_ArrivalStringConfirm event, Emitter<RouteSearchState> emit) async {
    //HERE COULD BE CHECK IF DEPARTURE EXIST (county, id)
    final newArrival = FlightRoutePartEntity(
      townId: 0,
      localContry: 'Russia',
      localTown: event.newArrival,
    );
    logger.warning('confirmArrivalByString');
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          arrival: newArrival,
        ),
      ),
    );
    //GO TO PRE SEARCH PAGE
    if (event.context != null && event.newArrival != '') {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          //HIDE BOTTOM SHEET
          Navigator.of(event.context!).pop();
          event.context?.push(RouteName.flightPreSearch).then(
            (value) {
              load(); //RELOAD
            },
          ); // TO PAGE
        },
      );
    }
  }

  Future<void> _confirmDepartureByString(_DepartureStringConfirm event, Emitter<RouteSearchState> emit) async {
    //HERE COULD BE CHECK IF DEPARTURE EXIST (county, id)
    final newDeparture = FlightRoutePartEntity(
      townId: 0,
      localContry: 'Russia',
      localTown: event.newDeparture,
    );
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          departure: newDeparture,
        ),
      ),
    );

    final success = await flightDepartureRepository.writeLastDeparture(newDeparture);
    logger.warning('confirmDepartureByString - saving success $success');
  }

  Future<void> _swap(_SwapRouteSearch event, Emitter<RouteSearchState> emit) async {
    logger.log('Search Route bloc _swap');
    if (state.flightRoute.arrival != null) {
      emit(
        RouteSearchState.loaded(
          flightRoute: state.flightRoute.copyWith(
            arrival: state.flightRoute.departure,
            departure: state.flightRoute.arrival,
          ),
        ),
      );
    }
  }

  Future<void> _clearArrival(_ClearArrivalRouteSearch event, Emitter<RouteSearchState> emit) async {
    logger.log('Search Route bloc _clearArrival');
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          arrival: null,
        ),
      ),
    );
  }
}
