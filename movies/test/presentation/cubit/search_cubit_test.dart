import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';
import '../../dummy_data/dummy_objects.dart';
import 'search_cubit_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late SearchCubit searchCubit;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchCubit = SearchCubit(mockSearchMovies);
  });

  tearDown(() async {
    await searchCubit.close();
  });

  group(
    'Movie Search',
    () {
      blocTest<SearchCubit, SearchState>(
        'Should emitsInOrder [Loading, Loaded] when success ',
        build: () {
          when(mockSearchMovies.execute(tQuery))
              .thenAnswer((_) async => Right(tMovieList));

          return searchCubit;
        },
        act: (bloc) => bloc.searchMovieData(tQuery),
        expect: () => [
          SearchLoading(),
          SearchHasData(tMovieList),
        ],
      );

      blocTest<SearchCubit, SearchState>(
        'Should emitsInOrder [Loading, Error] when unsuccess ',
        build: () {
          when(mockSearchMovies.execute(tQuery))
              .thenAnswer((_) async => Left(ServerFailure('error')));

          return searchCubit;
        },
        act: (bloc) => bloc.searchMovieData(tQuery),
        expect: () => [
          SearchLoading(),
          const SearchError('error'),
        ],
      );
    },
  );
}
