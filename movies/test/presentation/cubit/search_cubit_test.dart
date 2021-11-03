import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/movies.dart';

class MockSearch extends Mock implements SearchMovies {}

void main() {
  late MockSearch mockSearch;
  late SearchCubit cubit;
  final tMovie = <Movie>[];
  const query = 'spider';

  setUp(() {
    mockSearch = MockSearch();
    cubit = SearchCubit(mockSearch);
  });

  group('search movie cubit test', () {
    blocTest<SearchCubit, SearchState>(
      'should return Loading -> Loaded state when success load',
      build: () {
        when(() => mockSearch.execute(query))
            .thenAnswer((invocation) async => Right(tMovie));
        return cubit;
      },
      act: (bloc) => bloc.searchMovieData(query),
      expect: () {
        return [isA<SearchLoading>(), isA<SearchHasData>()];
      },
    );

    blocTest<SearchCubit, SearchState>(
      'should return Loading -> Error state when failed load',
      build: () {
        when(() => mockSearch.execute(query))
            .thenAnswer((invocation) async => Left(ServerFailure('error')));
        return cubit;
      },
      act: (bloc) => bloc.searchMovieData(query),
      expect: () {
        return [isA<SearchLoading>(), isA<SearchError>()];
      },
    );
  });
}
