import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';


class MockAiringTvsCubit extends MockCubit<TVSeriesAiringTodayState>
    implements TVSeriesAiringTodayCubit {}

class FakeLoadingAiringTvsState extends Fake
    implements TVSeriesAiringTodayLoading {}

class FakeLoadedAiringTvsState extends Fake implements TVSeriesAiringTodayLoaded {}

class FakeErrorAiringTvsState extends Fake implements TVSeriesAiringTodayError {}

void main() {
  late MockAiringTvsCubit mockCubit;
  setUpAll(() {
    registerFallbackValue(FakeLoadingAiringTvsState());
    registerFallbackValue(FakeLoadedAiringTvsState());
    registerFallbackValue(FakeErrorAiringTvsState());
  });
  setUp(() {
    mockCubit = MockAiringTvsCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TVSeriesAiringTodayCubit>(
      create: (BuildContext context) => mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        const testData = TVSeriesAiringTodayLoading();

        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(const AiringTVSeriesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView with TvCard when data is loaded',
          (WidgetTester tester) async {
        const testData = TVSeriesAiringTodayLoaded(items: [tTV]);
        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));

        final listViewFinder = find.byType(ListView);
        final tvCardFinder = find.byType(TVSeriesCard);

        await tester.pumpWidget(_makeTestableWidget(const AiringTVSeriesPage()));

        expect(listViewFinder, findsOneWidget);
        expect(tvCardFinder, findsWidgets);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        const testData = TVSeriesAiringTodayError('error');
        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));
        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(_makeTestableWidget(const AiringTVSeriesPage()));

        expect(textFinder, findsOneWidget);
      });
}
