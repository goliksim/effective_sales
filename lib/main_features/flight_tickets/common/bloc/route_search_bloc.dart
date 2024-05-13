import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/repositories/route_part_repository.dart';
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
  final RoutePartRepository routePartRepository;

  RouteSearchBloc(
    this.flightDepartureRepository,
    this.routePartRepository,
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
    on<_PickRandomArrival>(_pickRandomArrival);
  }

  void pickRandomArrival(BuildContext context) {
    add(RouteSearchEvent.pickRandomArrival(context));
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
      logger.log('RouteSearchBloc: loading departure');
      final routeDeparture = await flightDepartureRepository.getLastDeparture();

      emit(
        RouteSearchState.loaded(flightRoute: FlightRoute(departure: routeDeparture, arrival: null)),
      );
    } catch (e) {
      logger.warning('RouteSearchBloc: loading departure failed $e');
      emit(
        const RouteSearchState.loaded(flightRoute: FlightRoute(departure: null, arrival: null)),
      );
    }
  }

  Future<void> _confirmArrivalByString(_ArrivalStringConfirm event, Emitter<RouteSearchState> emit) async {
    logger.log('RouteSearchBloc: change arrival by string');
    //HERE COULD BE CHECK IF DEPARTURE EXIST (county, id)
    final newArrival = FlightRoutePartEntity(
      townId: 0,
      localContry: 'Russia',
      localTown: event.newArrival,
    );
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          arrival: newArrival,
        ),
      ),
    );
    //GO TO PRE SEARCH PAGE
    if (event.context != null && event.newArrival != '') {
      logger.log('RouteSearchBloc: confirm arrival');
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
    logger.log('RouteSearchBloc: change departure by string');
    //HERE COULD BE CHECK IF DEPARTURE EXIST (county, id)
    final newDeparture = (event.newDeparture != '')
        ? FlightRoutePartEntity(
            townId: 0,
            localContry: 'Russia',
            localTown: event.newDeparture,
          )
        : state.flightRoute.departure;
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          departure: newDeparture,
        ),
      ),
    );

    if (newDeparture != null) {
      logger.log('RouteSearchBloc: saving departure');
      final success = await flightDepartureRepository.writeLastDeparture(newDeparture);
      if (success) {
        logger.fine('RouteSearchBloc: saving departure succesful');
      } else {
        logger.warning('RouteSearchBloc: saving departure failed');
      }
    }
  }

  Future<void> _swap(_SwapRouteSearch event, Emitter<RouteSearchState> emit) async {
    logger.log('RouteSearchBloc: swap arrival and departure');
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
    logger.log('RouteSearchBloc: clear arrival');
    emit(
      RouteSearchState.loaded(
        flightRoute: state.flightRoute.copyWith(
          arrival: null,
        ),
      ),
    );
  }

  Future<void> _pickRandomArrival(_PickRandomArrival event, Emitter<RouteSearchState> emit) async {
    try {
      logger.log('RouteSearchBloc: pick random arrival');
      final departure = state.flightRoute.departure;

      final newArrival = (departure == null)
          ? await routePartRepository.getRandomArrival()
          : await routePartRepository.getRandomAvailableArrival(departure);

      if (newArrival != null) {
        if (newArrival != state.flightRoute.arrival) {
          logger.fine('RouteSearchBloc: call confirm by random arrival');
          add(
            RouteSearchEvent.confirmArrivalByString(
              newArrival.localTown,
              event.context,
            ),
          );
        }
      }
    } catch (e) {
      logger.warning('RouteSearchBloc: failed to get random arrival $e');
    }
  }
}
