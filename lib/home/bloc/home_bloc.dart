import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gathrr/home/service/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetEvents>(_onGetEvents);
  }

  final HomeService _hs = HomeService();

  void _onGetEvents(GetEvents event, Emitter emit) async {
    log('getting events');
    final response = _hs.getEvents();
  }
}
