enum RequestState { Empty, Loading, Loaded, Error }
enum CategoryMenu { Movie, TVSeries }
enum SeeMoreState { Popular, TopRated }

const Map<CategoryMenu, String> categoryMenuValues = {
  CategoryMenu.Movie: 'movie',
  CategoryMenu.TVSeries: 'tv_series',
};
