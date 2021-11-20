import 'package:core/core.dart';
import 'package:core/database/database_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieNowPlayingCubit(
      getNowPlayingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailCubit(
      getMovieDetail: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
      getWatchListStatus: locator(),
    ),
  );
  locator.registerFactory(
    () => MoviePopularCubit(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationsCubit(
      getMovieRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieTopRatedCubit(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieWatchlistCubit(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesAiringTodayCubit(
      getAiringTodayTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesPopularCubit(
      getPopularTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesTopRatedCubit(
      getTopRatedTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesEpisodeSeasonCubit(
      getEpisodeSeasonTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesRecommendationsCubit(
      getRecommendationTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesDetailCubit(
      getDetailTVSeries: locator(),
      getWatchListStatusTVSeries: locator(),
      saveWatchlistTVSeries: locator(),
      removeWatchlistTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesSearchCubit(
      searchTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesWatchlistCubit(
      getWatchlistTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchCubit(
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(
    () => GetAiringTodayTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetPopularTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetTopRatedTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetDetailTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetRecommendationTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetWatchListStatusTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => SaveWatchlistTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => RemoveWatchlistTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => SearchTVSeries(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetWatchlistTVSeries(repository: locator()),
  );

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      tvRemoteDataSource: locator(),
      tvLocalDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TVRemoteDataSource>(
    () => TVRemoteDataSourceImp(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<TVLocalDataSource>(
    () => TVLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
