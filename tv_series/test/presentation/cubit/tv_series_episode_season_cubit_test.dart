import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_episode_season_cubit_test.mocks.dart';

@GenerateMocks([GetEpisodeSeasonTVSeries])
void main() {
  late TVSeriesEpisodeSeasonCubit cubit;
  late MockGetEpisodeSeasonTVSeries mockGetEpisodeSeasonTVSeries;
  setUp(() {
    EquatableConfig.stringify = true;
    mockGetEpisodeSeasonTVSeries = MockGetEpisodeSeasonTVSeries();
    cubit = TVSeriesEpisodeSeasonCubit(
        getEpisodeSeasonTVSeries: mockGetEpisodeSeasonTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Episode Season',
    () {
      final mockTVDetail = TVDetailResponse.fromJson(jsonDetailTV).toEntity();
      final mockListEpisodeSeasonTV = jsonListEpisodeSeasonTV
          .map((e) => EpisodeModel.fromJson(e).toEntity())
          .toList();
      blocTest<TVSeriesEpisodeSeasonCubit, TVSeriesEpisodeSeasonState>(
        'should EmitsInOrder [Loading, Loaded] when successful',
        build: () {
          when(mockGetEpisodeSeasonTVSeries.execute(
                  id: mockTVDetail.id, seasonNumber: 1))
              .thenAnswer((_) async => Right(mockListEpisodeSeasonTV));
          return cubit;
        },
        act: (bloc) => bloc.get(id: mockTVDetail.id, seasonNumber: 1),
        expect: () => [
          const TVSeriesEpisodeSeasonLoadingState(),
          TVSeriesEpisodeSeasonLoadedState(items: mockListEpisodeSeasonTV),
        ],
      );

      blocTest<TVSeriesEpisodeSeasonCubit, TVSeriesEpisodeSeasonState>(
        'should EmitsInOrder [Loading, Error] when unsuccessful',
        build: () {
          when(mockGetEpisodeSeasonTVSeries.execute(
                  id: mockTVDetail.id, seasonNumber: 1))
              .thenAnswer((_) async => Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(id: mockTVDetail.id, seasonNumber: 1),
        expect: () => [
          const TVSeriesEpisodeSeasonLoadingState(),
          const TVSeriesEpisodeSeasonErrorState('error'),
        ],
      );
    },
  );
}
