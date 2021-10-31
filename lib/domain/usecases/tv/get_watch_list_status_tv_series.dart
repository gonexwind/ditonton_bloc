import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchListStatusTVSeries {
  final TVRepository repository;
  GetWatchListStatusTVSeries({
    required this.repository,
  });

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTVSeries(id);
  }
}
