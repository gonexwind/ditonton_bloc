import 'package:ditonton/domain/usecases/tv/get_watch_list_status_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetWatchListStatusTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetWatchListStatusTVSeries(repository: repository);
  });

  const int id = 1;

  test(
    'should get watchlist status from repository ',
    () async {
      // arrange
      when(repository.isAddedToWatchlistTVSeries(id)).thenAnswer((_) async => true);
      // act
      final result = await usecase.execute(id);
      // assert
      expect(result, true);
    },
  );
}
