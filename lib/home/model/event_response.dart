import 'package:equatable/equatable.dart';
import 'package:gathrr/home/model/event.dart';

class EventRespnseModel extends Equatable {
  const EventRespnseModel(this.events, this.hasError, this.errormEssage);

  EventRespnseModel.success(List<Event>? events)
      : events = events!,
        hasError = false,
        errormEssage = 'NO_ERROR';

  EventRespnseModel.failure(String errorMessage)
      : events = [],
        hasError = true,
        errormEssage = errorMessage;

  final List<Event> events;
  final bool hasError;
  final String errormEssage;

  @override
  List<Object?> get props => [events, hasError, errormEssage];
}
