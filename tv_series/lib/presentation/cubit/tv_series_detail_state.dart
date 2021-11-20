part of 'tv_series_detail_cubit.dart';

class TVSeriesDetailState extends Equatable {
  final TVDetail tv;
  final RequestState requestState;
  final String message;
  final String messageWatchlist;
  final bool isAddedToWatchlist;

  const TVSeriesDetailState({
    this.tv = const TVDetail(),
    this.requestState = RequestState.Empty,
    this.message = '',
    this.messageWatchlist = '',
    this.isAddedToWatchlist = false,
  });

  TVSeriesDetailState setTV(TVDetail tv) => copyWith(tv: tv);
  TVSeriesDetailState setAddedToWatchlist(bool value) => copyWith(isAddedToWatchlist: value);
  TVSeriesDetailState setRequestState(RequestState requestState) =>
      copyWith(requestState: requestState);
  TVSeriesDetailState setMessage(String message) => copyWith(message: message);
  TVSeriesDetailState setMessageWatchlist(String message) => copyWith(messageWatchlist: message);

  @override
  List<Object> get props {
    return [
      tv,
      requestState,
      message,
      messageWatchlist,
      isAddedToWatchlist,
    ];
  }

  @override
  bool get stringify => true;

  TVSeriesDetailState copyWith({
    TVDetail? tv,
    RequestState? requestState,
    String? message,
    String? messageWatchlist,
    bool? isAddedToWatchlist,
  }) {
    return TVSeriesDetailState(
      tv: tv ?? this.tv,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      messageWatchlist: messageWatchlist ?? this.messageWatchlist,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
    );
  }
}
