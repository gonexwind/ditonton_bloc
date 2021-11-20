part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  final MovieDetail movie;
  final bool isAddedToWatchlist;
  final String message;
  final String messageWatchlist;
  final RequestState requestState;

  const MovieDetailState({
    this.movie = const MovieDetail(),
    this.isAddedToWatchlist = false,
    this.message = '',
    this.messageWatchlist = '',
    this.requestState = RequestState.Empty,
  });

  MovieDetailState setMovie(MovieDetail movie) => copyWith(movie: movie);
  MovieDetailState setAddedToWatchlist(bool value) => copyWith(isAddedToWatchlist: value);
  MovieDetailState setRequestState(RequestState requestState) =>
      copyWith(requestState: requestState);
  MovieDetailState setMessage(String message) => copyWith(message: message);
  MovieDetailState setMessageWatchlist(String message) => copyWith(messageWatchlist: message);

  @override
  List<Object> get props {
    return [
      movie,
      isAddedToWatchlist,
      message,
      messageWatchlist,
      requestState,
    ];
  }

  @override
  bool get stringify => true;

  MovieDetailState copyWith({
    MovieDetail? movie,
    bool? isAddedToWatchlist,
    String? message,
    String? messageWatchlist,
    RequestState? requestState,
  }) {
    return MovieDetailState(
      movie: movie ?? this.movie,
      isAddedToWatchlist: isAddedToWatchlist ?? this.isAddedToWatchlist,
      message: message ?? this.message,
      messageWatchlist: messageWatchlist ?? this.messageWatchlist,
      requestState: requestState ?? this.requestState,
    );
  }
}
