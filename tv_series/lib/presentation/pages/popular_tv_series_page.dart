import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';

class PopularTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  @override
  _PopularTVSeriesPageState createState() => _PopularTVSeriesPageState();
}

class _PopularTVSeriesPageState extends State<PopularTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<TVSeriesCubit>(context, listen: false)
            .getPopularTVSeries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV Series'),
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
                  final tvSeries = state.popularTVSeries[index];
                  return TVSeriesCard(tvSeries);
                },
                itemCount: state.popularTVSeries.length,
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
