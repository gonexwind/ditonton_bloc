import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Material(child: body),
      onGenerateRoute: (setting) => MaterialPageRoute(
        builder: (ctx) => TVSeriesCard(tTV),
      ),
    );
  }

  testWidgets('Page should display poster path', (WidgetTester tester) async {
    final inkwell = find.byType(InkWell);
    await tester.pumpWidget(
      _makeTestableWidget(
        TVSeriesCard(tTV),
      ),
    );
    await tester.tap(inkwell);
  });
}

const tTV = TV(
  backdropPath: 'backdropPath',
  firstAirDate: '2010-06-08',
  genreIds: [1],
  id: 1,
  name: 'name',
  originCountry: ['US'],
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 8.0,
  posterPath: 'posterPath',
  voteAverage: 6.0,
  voteCount: 2,
);