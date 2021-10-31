import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetAiringTodayTVSeries {
  final TVRepository repository;
  const GetAiringTodayTVSeries({
    required this.repository,
  });

  Future<Either<Failure, List<TV>>> execute() async {
    return repository.getAiringTodayTVSeries();
  }
}
