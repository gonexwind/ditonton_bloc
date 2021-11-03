import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/movies.dart';

class MockGetNowPlayingMovies extends Mock implements GetNowPlayingMovies {}

class MockGetPopularMovies extends Mock implements GetPopularMovies {}

class MockGetTopRatedMovies extends Mock implements GetTopRatedMovies {}

void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopular;
  late MockGetTopRatedMovies mockGetTopRated;
  late MovieListCubit movielistCubit;
  final tMv = <Movie>[];

  setUp(
    () {
      mockGetNowPlayingMovies = MockGetNowPlayingMovies();
      mockGetPopular = MockGetPopularMovies();
      mockGetTopRated = MockGetTopRatedMovies();

      movielistCubit = MovieListCubit(
        getNowPlayingMovies: mockGetNowPlayingMovies,
        getPopularMovies: mockGetPopular,
        getTopRatedMovies: mockGetTopRated,
      );
    },
  );

  group('movie list cubit test', () {
    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Loaded state when success load',
        build: () {
          when(() => mockGetNowPlayingMovies.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesLoaded>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state when failed load',
        build: () {
          when(() => mockGetNowPlayingMovies.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state when failed OnAir request',
        build: () {
          when(() => mockGetNowPlayingMovies.execute())
              .thenAnswer((invocation) async => Left(ServerFailure("error")));
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state  when failed Popular request',
        build: () {
          when(() => mockGetNowPlayingMovies.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Left(ServerFailure("error")));
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state  when failed Top Rated request',
        build: () {
          when(() => mockGetNowPlayingMovies.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Right(tMv));
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Left(ServerFailure("error")));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });
  });

  group('popular only cubit test', () {
    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> PopularLoaded state when success load popular',
        build: () {
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchPopularMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesPopularLoaded>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state when failed load popular',
        build: () {
          when(() => mockGetPopular.execute())
              .thenAnswer((invocation) async => Left(ServerFailure("error")));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchPopularMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });
  });

  group('top rated only cubit test', () {
    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> TopRatedLoaded state when success load top rated',
        build: () {
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Right(tMv));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchTopRatedMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesTopRatedLoaded>()];
        });

    blocTest<MovieListCubit, MovieListState>(
        'should return Loading -> Error state when failed load top rated',
        build: () {
          when(() => mockGetTopRated.execute())
              .thenAnswer((invocation) async => Left(ServerFailure("error")));
          return movielistCubit;
        },
        act: (bloc) => bloc.fetchTopRatedMovies(),
        expect: () {
          return [isA<MoviesLoading>(), isA<MoviesError>()];
        });
  });
}
