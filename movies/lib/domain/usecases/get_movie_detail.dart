import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:movies/movies.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
