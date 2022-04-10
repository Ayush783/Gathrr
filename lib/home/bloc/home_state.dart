part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = true,
    this.events = const [],
    this.hasError = false,
    this.errorMessage = 'NO_ERROR',
    this.carouselIndex = 1,
  });

  final List<Event> events;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final int carouselIndex;

  HomeState copyWith({
    List<Event>? events,
    bool isLoading = false,
    bool hasError = false,
    String errorMessage = 'NO_ERROR',
    int? carouselIndex,
  }) {
    return HomeState(
      events: events ?? this.events,
      isLoading: isLoading,
      hasError: hasError,
      errorMessage: errorMessage,
      carouselIndex: carouselIndex ?? this.carouselIndex,
    );
  }

  @override
  List<Object> get props => [
        events,
        isLoading,
        hasError,
        errorMessage,
        carouselIndex,
      ];
}
