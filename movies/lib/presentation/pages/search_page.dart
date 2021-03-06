import 'dart:async';

import 'package:core/core.dart';
import 'package:movies/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';

class SearchCategory {
  final String title;
  final CategoryMenu category;

  SearchCategory({
    required this.title,
    required this.category,
  });
}

final _categories = <SearchCategory>[
  SearchCategory(
    title: 'Movie',
    category: CategoryMenu.Movie,
  ),
  SearchCategory(
    title: 'TV Series',
    category: CategoryMenu.TVSeries,
  ),
];

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCategory _selectedCategory;
  bool _searchMovies = true;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          Container(
            // color: Colors.black12,
            child: DropdownButton<SearchCategory>(
              value: _selectedCategory,
              onChanged: (value) {
                _searchMovies = !_searchMovies;
                setState(() => _selectedCategory = value!);
              },
              items: _categories
                  .map(
                    (e) => DropdownMenuItem<SearchCategory>(
                      child: Text('${e.title}'),
                      value: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  if (query.isNotEmpty) {
                    if (_searchMovies) {
                      context.read<SearchCubit>().searchMovieData(query);
                    } else {
                      context.read<TVSeriesSearchCubit>().searchTvData(query);
                    }
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            if (_selectedCategory.category == CategoryMenu.Movie) ...[
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is SearchHasData) {
                    final result = state.result;
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final movie = result[index];
                          return MovieCard(movie);
                        },
                        itemCount: result.length,
                      ),
                    );
                  } else if (state is SearchError) {
                    return Expanded(child: Center(child: Text(state.message)));
                  } else {
                    return Expanded(
                      child: Center(
                        child: Text('Ooopss..Movies not found...'),
                      ),
                    );
                  }
                },
              ),
            ] else ...[
              BlocBuilder<TVSeriesSearchCubit, TVSeriesSearchState>(
                builder: (context, state) {
                  if (state is TVSeriesSearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TVSeriesSearchLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final tvSeries = state.result[index];
                          return TVSeriesCard(tvSeries);
                        },
                        itemCount: state.result.length,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: Text('Ooopss..TV Series not found...'),
                      ),
                    );
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
