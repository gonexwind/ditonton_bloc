import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTopRatedTvsCubit extends MockCubit<TVSeriesTopRatedState>
    implements TVSeriesTopRatedCubit {}

class FakeLoadingTopRatedTvsState extends Fake
    implements TVSeriesTopRatedLoadingState {}

class FakeLoadedTopRatedTvsState extends Fake
    implements TVSeriesTopRatedLoadedState {}

class FakeErrorTopRatedTvsState extends Fake
    implements TVSeriesTopRatedErrorState {}

void main() {
  late MockTopRatedTvsCubit mockCubit;
  setUpAll(() {
    registerFallbackValue(FakeLoadingTopRatedTvsState());
    registerFallbackValue(FakeLoadedTopRatedTvsState());
    registerFallbackValue(FakeErrorTopRatedTvsState());
  });
  setUp(() {
    mockCubit = MockTopRatedTvsCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TVSeriesTopRatedCubit>(
      create: (context) => mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    const testData = TVSeriesTopRatedLoadingState();

    when(() => mockCubit.state).thenAnswer((_) => testData);
    when(() => mockCubit.get()).thenAnswer((invocation) async => invocation);
    whenListen(mockCubit, Stream.fromIterable([testData]));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTVSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView with TvCard when data is loaded',
      (WidgetTester tester) async {
    const testData = TVSeriesTopRatedLoadedState(items: [tTV]);

    when(() => mockCubit.state).thenAnswer((_) => testData);
    when(() => mockCubit.get())
        .thenAnswer((invocation) async => invocation);
    whenListen(mockCubit, Stream.fromIterable([testData]));

    final listViewFinder = find.byType(ListView);
    final tvCardFinder = find.byType(TVSeriesCard);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTVSeriesPage()));

    expect(listViewFinder, findsOneWidget);
    expect(tvCardFinder, findsWidgets);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    const testData = TVSeriesTopRatedErrorState('error');

    when(() => mockCubit.state).thenAnswer((_) => testData);
    when(() => mockCubit.get())
        .thenAnswer((invocation) async => invocation);
    whenListen(mockCubit, Stream.fromIterable([testData]));
    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTVSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
