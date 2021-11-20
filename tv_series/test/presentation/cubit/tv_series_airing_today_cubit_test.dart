import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_airing_today_cubit_test.mocks.dart';

@GenerateMocks([GetAiringTodayTVSeries])
void main() {
  late MockGetAiringTodayTVSeries mockGetAiringTodayTVSeries;
  late TVSeriesAiringTodayCubit cubit;

  setUp(() {
    EquatableConfig.stringify = true;
    mockGetAiringTodayTVSeries = MockGetAiringTodayTVSeries();
    cubit = TVSeriesAiringTodayCubit(
      getAiringTodayTVSeries: mockGetAiringTodayTVSeries,
    );
  });

  tearDown(() async {
    await cubit.close();
  });

  final mockListTV = jsonListSearchTV
      .map(
        (e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)).toEntity(),
      )
      .toList();

  group('TV Series Airing Today', () {
    blocTest<TVSeriesAiringTodayCubit, TVSeriesAiringTodayState>(
      'state should be loaded when function called',
      build: () {
        when(mockGetAiringTodayTVSeries.execute())
            .thenAnswer((_) async => Right(mockListTV));
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesAiringTodayLoading(),
        TVSeriesAiringTodayLoaded(items: mockListTV),
      ],
    );

    blocTest<TVSeriesAiringTodayCubit, TVSeriesAiringTodayState>(
      'Should be error when function called',
      build: () {
        when(mockGetAiringTodayTVSeries.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesAiringTodayLoading(),
        const TVSeriesAiringTodayError('error'),
      ],
    );
  });
}
