import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';

class TopRatedTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv-series';

  @override
  _TopRatedTVSeriesPageState createState() => _TopRatedTVSeriesPageState();
}

class _TopRatedTVSeriesPageState extends State<TopRatedTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<TVSeriesCubit>(context, listen: false)
            .getTopRatedTVSeries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TVSeriesCubit, TVSeriesState>(
          builder: (context, state) {
            if (state is TVSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TVSeriesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.topRatedTVSeries[index];
                  return TVSeriesCard(tvSeries);
                },
                itemCount: state.topRatedTVSeries.length,
              );
            } else if (state is TVSeriesError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text("Failed to get data"),
              );
            }
          },
        ),
      ),
    );
  }
}
