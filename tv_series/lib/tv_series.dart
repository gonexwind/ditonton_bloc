library tv_series;

// datasources
export 'data/datasources/tv_local_data_source.dart';
export 'data/datasources/tv_remote_data_source.dart';

// models
export 'data/models/tv_createdby_model.dart';
export 'data/models/tv_crew_model.dart';
export 'data/models/tv_detail_model.dart';
export 'data/models/tv_episode_model.dart';
export 'data/models/tv_last_episode_to_air_model.dart';
export 'data/models/tv_local_database_model.dart';
export 'data/models/tv_model.dart';
export 'data/models/tv_network_model.dart';
export 'data/models/tv_production_country_model.dart';
export 'data/models/tv_season_model.dart';
export 'data/models/tv_spoken_language_model.dart';

// repositories
export 'data/repositories/tv_repository_impl.dart';

// entities
export 'domain/entities/tv_created_by.dart';
export 'domain/entities/tv_crew.dart';
export 'domain/entities/tv_episode.dart';
export 'domain/entities/tv_network.dart';
export 'domain/entities/tv_production_country.dart';
export 'domain/entities/tv_season.dart';
export 'domain/entities/tv_spoken_language.dart';
export 'domain/entities/tv_last_episode_to_air.dart';
export 'domain/entities/tv.dart';
export 'domain/entities/tv_detail.dart';

// repositories
export 'domain/repositories/tv_repository.dart';

// usecases
export 'domain/usecases/get_airing_today_tv_series.dart';
export 'domain/usecases/get_detail_tv_series.dart';
export 'domain/usecases/get_episode_season_tv_series.dart';
export 'domain/usecases/get_popular_tv_series.dart';
export 'domain/usecases/get_recommendation_tv_series.dart';
export 'domain/usecases/get_top_rated_tv_series.dart';
export 'domain/usecases/get_watch_list_status_tv_series.dart';
export 'domain/usecases/get_watchlist_tv_series.dart';
export 'domain/usecases/remove_watchlist_tv_series.dart';
export 'domain/usecases/save_watchlist_tv_series.dart';
export 'domain/usecases/search_tv_series.dart';

// bloc

// pages
export 'presentation/pages/airing_tv_series_page.dart';
export 'presentation/pages/popular_tv_series_page.dart';
export 'presentation/pages/top_rated_tv_series_page.dart';
export 'presentation/pages/tv_series_detail_page.dart';

// provider
export 'presentation/provider/airing_tv_series_notifier.dart';
export 'presentation/provider/popular_tv_series_notifier.dart';
export 'presentation/provider/top_rated_tv_series_notifier.dart';
export 'presentation/provider/tv_series_detail_notifier.dart';
export 'presentation/provider/tv_series_list_notifier.dart';
export 'presentation/provider/tv_series_search_notifier.dart';
export 'presentation/provider/watchlist_tv_series_notifier.dart';

// widgets
export 'presentation/widgets/tv_series_card_list.dart';
