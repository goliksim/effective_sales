import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'flight_page_bloc.freezed.dart';
part 'flight_page_events.dart';
part 'flight_page_states.dart';

extension FlightPageBuilder on BuildContext {
  FlightPageState? get profileState => BlocProvider.of<FlightPageBloc>(this).state;
  FlightPageBloc? get profileBloc => BlocProvider.of<FlightPageBloc>(this);
}

@singleton
class FlightPageBloc extends Bloc<FlightPageEvent, FlightPageState> {
  FlightPageBloc() : super(const FlightPageState.init()) {
    on<FlightPageEvent>((event, emit) {});
  }
}
