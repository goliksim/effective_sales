import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/router_config.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_ticket_type.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/repositories/ticket_offers_repositories.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_offers_request_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/flight_pre_search_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'flight_search_bloc.freezed.dart';
part 'flight_search_events.dart';
part 'flight_search_states.dart';

extension FlightSearchBuilder on BuildContext {
  FlightSearchState? get flightSearchState => BlocProvider.of<FlightSearchBloc>(this).state;
  FlightSearchBloc? get flightSearchBloc => BlocProvider.of<FlightSearchBloc>(this);
}

@singleton
class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {
  final FlightPreSearchRepository flightPreSearchRepository;
  final TicketOffersRepository ticketOffersRepository;
  FlightSearchBloc(
    this.flightPreSearchRepository,
    this.ticketOffersRepository,
  ) : super(
          FlightSearchState.init(
            requestEntity: FlightOffersRequestEntity(
              route: const FlightRoute(arrival: null, departure: null),
              date: DateTime.now(),
            ),
          ),
        ) {
    on<_FlightSearchLoad>(_loadRoute);
    on<_FlightPreSearch>(_preSearch);
    on<_FlightToSearch>(_toSearch);
    on<_FlightSearch>(_search);
    on<_FlightSearchDateChanger>(_updateDate);
    on<_FlightSearchWayChanger>(_updateReverseDate);
    on<_FlightSearchTypesChanger>(_updateTicketTypes);
  }
  void loadRoute(FlightRoute route) {
    add(FlightSearchEvent.loadRoute(route));
  }

  void preSearch() {
    add(const FlightSearchEvent.preSearch());
  }

  void toSearch(BuildContext context) {
    add(FlightSearchEvent.toSearch(context));
  }

  void search() {
    add(const FlightSearchEvent.search());
  }

  void updateRequestDate(DateTime date) {
    add(FlightSearchEvent.updateRequestDate(date));
  }

  void updateReverseDate(DateTime? date) {
    add(FlightSearchEvent.updateReverseDate(date));
  }

  void updateTicketTypes(int count, FlightTicketType type) {
    add(FlightSearchEvent.updateTicketTypes(count, type));
  }

  Future<void> _loadRoute(_FlightSearchLoad event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc:  load RouteEntity to bloc');
    emit(
      FlightSearchState.init(
        requestEntity: state.requestEntity.copyWith(
          route: event.route,
        ),
      ),
    );
    logger.log('FlightSearchBloc:  call _preSearch from route loading');
    add(const FlightSearchEvent.preSearch());
  }

  Future<void> _preSearch(_FlightPreSearch event, Emitter<FlightSearchState> emit) async {
    try {
      logger.log('FlightSearchBloc: _preSearch start');
      if (state.requestEntity.route.arrival == null) {
        logger.warning('FlightSearchBloc: _preSearch arrival is null');
        emit(
          FlightSearchState.init(
            requestEntity: state.requestEntity,
          ),
        );
        return;
      }
      final ticketOffers = await flightPreSearchRepository.getTicketsOffers(state.requestEntity);
      logger.fine('FlightSearchBloc _preSearch offers -  $ticketOffers');

      emit(
        FlightSearchState.preSearch(
          requestEntity: state.requestEntity,
          offersEntity: ticketOffers,
        ),
      );
    } catch (e) {
      logger.warning('FlightSearchBloc:  _preSearch failed $e');
      emit(
        FlightSearchState.error(
          requestEntity: state.requestEntity,
        ),
      );
    }
  }

  Future<void> _updateDate(_FlightSearchDateChanger event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc: _updateDate ${event.date}');
    final requestEntity = state.requestEntity.copyWith(date: event.date);

    emit(
      FlightSearchState.init(
        requestEntity: requestEntity,
      ),
    );
    logger.fine('FlightSearchBloc: _updateDate call _preSearch');
    add(
      const FlightSearchEvent.preSearch(),
    );
  }

  Future<void> _updateReverseDate(_FlightSearchWayChanger event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc: _updateReverseDate ${event.date}');
    final requestEntity = state.requestEntity.copyWith(
      reverseDate: event.date,
    );

    emit(
      FlightSearchState.init(
        requestEntity: requestEntity,
      ),
    );

    logger.fine('FlightSearchBloc: _updateReverseDate call _preSearch');
    add(
      const FlightSearchEvent.preSearch(),
    );
  }

  Future<void> _updateTicketTypes(_FlightSearchTypesChanger event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc: _updateTypes ${event.type} ${event.count}');
    final requestEntity = state.requestEntity.copyWith(
      ticketsCount: event.count,
      ticketsType: event.type,
    );
    emit(
      FlightSearchState.init(
        requestEntity: requestEntity,
      ),
    );

    logger.fine('FlightSearchBloc: _updateTypes call _preSearch');
    add(const FlightSearchEvent.preSearch());
  }

  Future<void> _toSearch(_FlightToSearch event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc _ToSearch');
    event.context.push(RouteName.flightEndSearch).then(
      (value) {
        logger.log('FlightSearchBloc _ToSearch complete, call _preSearch');
        preSearch();
      },
    );
  }

  Future<void> _search(_FlightSearch event, Emitter<FlightSearchState> emit) async {
    logger.log('FlightSearchBloc: _Search');
    try {
      final tickets = await ticketOffersRepository.getTicketOffers(
        state.requestEntity,
      );
      logger.fine('FlightSearchBloc: _Search $tickets');

      emit(
        FlightSearchState.ticketsLoaded(
          requestEntity: state.requestEntity,
          tickets: tickets,
        ),
      );
    } catch (e) {
      logger.log('FlightSearchBloc: _Search $e');
      emit(FlightSearchState.error(requestEntity: state.requestEntity));
    }
  }
}
