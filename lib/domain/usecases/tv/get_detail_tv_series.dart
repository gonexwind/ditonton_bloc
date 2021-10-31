import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetDetailTVSeries {
  final TVRepository repository;
  GetDetailTVSeries({
    required this.repository,
  });

  Future<Either<Failure, TVDetail>> execute(int id) {
    return repository.getDetailTVSeries(id);
  }
}
