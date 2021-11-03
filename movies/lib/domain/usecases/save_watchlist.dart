import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:movies/movies.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
