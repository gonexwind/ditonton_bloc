import 'package:core/core.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  await Firebase.initializeApp();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieNowPlayingCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MoviePopularCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationsCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieTopRatedCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchlistCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesAiringTodayCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesPopularCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesTopRatedCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesEpisodeSeasonCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesRecommendationsCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesSearchCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TVSeriesWatchlistCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ditonton',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: HomeMoviePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TVSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVSeriesDetailPage(id: id),
                settings: settings,
              );
            case AiringTVSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => AiringTVSeriesPage());
            case PopularTVSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTVSeriesPage());
            case TopRatedTVSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTVSeriesPage());

            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
