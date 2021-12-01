import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';


class MockPopularTvsCubit extends MockCubit<TVSeriesPopularState>
    implements TVSeriesPopularCubit {}

class FakeLoadingPopularTvsState extends Fake
    implements TVSeriesPopularLoadingState {}

class FakeLoadedPopularTvsState extends Fake implements TVSeriesPopularLoadedState {}

class FakeErrorPopularTvsState extends Fake implements TVSeriesPopularErrorState {}

void main() {
  late MockPopularTvsCubit mockCubit;
  setUpAll(() {
    registerFallbackValue(FakeLoadingPopularTvsState());
    registerFallbackValue(FakeLoadedPopularTvsState());
    registerFallbackValue(FakeErrorPopularTvsState());
  });
  setUp(() {
    mockCubit = MockPopularTvsCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TVSeriesPopularCubit>(
      create: (BuildContext context) => mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        const testData = TVSeriesPopularLoadingState();

        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(const PopularTVSeriesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView with TvCard when data is loaded',
          (WidgetTester tester) async {
        const testData = TVSeriesPopularLoadedState(items: [tTV]);
        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));

        final listViewFinder = find.byType(ListView);
        final tvCardFinder = find.byType(TVSeriesCard);

        await tester.pumpWidget(_makeTestableWidget(const PopularTVSeriesPage()));

        expect(listViewFinder, findsOneWidget);
        expect(tvCardFinder, findsWidgets);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        const testData = TVSeriesPopularErrorState('error');
        when(() => mockCubit.state).thenAnswer((_) => testData);
        when(() => mockCubit.get())
            .thenAnswer((invocation) async => invocation);
        whenListen(mockCubit, Stream.fromIterable([testData]));
        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(_makeTestableWidget(const PopularTVSeriesPage()));

        expect(textFinder, findsOneWidget);
      });
}
