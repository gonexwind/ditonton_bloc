import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_series_search_cubit_test.mocks.dart';

@GenerateMocks([SearchTVSeries])
void main() {
  late TVSeriesSearchCubit searchCubit;
  late MockSearchTVSeries mockSearchTVSeries;

  setUp(() {
    mockSearchTVSeries = MockSearchTVSeries();
    searchCubit = TVSeriesSearchCubit(searchTVSeries: mockSearchTVSeries);
  });

  tearDown(() async {
    await searchCubit.close();
  });

  group(
    'TV Series Search',
    () {
      const query = 'your lie in april';
      final mockListTV =
          jsonListSearchTV.map((e) => TVModel.fromJson(e).toEntity()).toList();

      blocTest<TVSeriesSearchCubit, TVSeriesSearchState>(
        'Should emitsInOrder [Loading, Loaded] when success ',
        build: () {
          when(mockSearchTVSeries.execute(query))
              .thenAnswer((_) async => Right(mockListTV));

          return searchCubit;
        },
        act: (bloc) => bloc.searchTvData(query),
        expect: () => [
          TVSeriesSearchLoading(),
          TVSeriesSearchLoaded(mockListTV),
        ],
      );

      blocTest<TVSeriesSearchCubit, TVSeriesSearchState>(
        'Should emitsInOrder [Loading, Error] when unsuccess ',
        build: () {
          when(mockSearchTVSeries.execute(query))
              .thenAnswer((_) async => Left(ServerFailure('error')));

          return searchCubit;
        },
        act: (bloc) => bloc.searchTvData(query),
        expect: () => [
          TVSeriesSearchLoading(),
          const TVSeriesSearchError('error'),
        ],
      );
    },
  );
}
