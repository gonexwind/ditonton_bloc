part of 'tv_series_airing_today_cubit.dart';

abstract class TVSeriesAiringTodayState extends Equatable {
  const TVSeriesAiringTodayState();
  @override
  List<Object> get props => [];
}

class TVSeriesAiringTodayInitial extends TVSeriesAiringTodayState {
  const TVSeriesAiringTodayInitial();
}

class TVSeriesAiringTodayLoading extends TVSeriesAiringTodayState {
  const TVSeriesAiringTodayLoading();
}

class TVSeriesAiringTodayLoaded extends TVSeriesAiringTodayState {
  const TVSeriesAiringTodayLoaded({
    required this.items,
  });

  final List<TV> items;

  int get totalData => items.length;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  TVSeriesAiringTodayLoaded copyWith({
    List<TV>? items,
  }) {
    return TVSeriesAiringTodayLoaded(
      items: items ?? this.items,
    );
  }
}

class TVSeriesAiringTodayError extends TVSeriesAiringTodayState {
  const TVSeriesAiringTodayError(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  TVSeriesAiringTodayError copyWith({
    String? message,
  }) {
    return TVSeriesAiringTodayError(
      message ?? this.message,
    );
  }
}
