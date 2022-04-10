import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gathrr/home/model/event.dart';
import 'package:gathrr/home/service/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetEvents>(_onGetEvents);
    on<CarouselSwipe>(_onCarouselSwipe);
  }

  final HomeService _hs = HomeService();

  void _onCarouselSwipe(CarouselSwipe event, Emitter emit) {
    log(event.index.toString());
    emit(
      state.copyWith(carouselIndex: event.index),
    );
  }

  void _onGetEvents(GetEvents event, Emitter emit) async {
    log('getting events');
    final response = await _hs.getEvents();
    log(response.errormEssage);
    if (response.hasError) {
      emit(
        state.copyWith(
          hasError: true,
          errorMessage: response.errormEssage,
        ),
      );
    } else {
      log('emit events');
      emit(
        state.copyWith(
          events: response.events,
        ),
      );
    }
  }
}
