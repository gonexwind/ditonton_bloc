import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_top_rated_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';

class TopRatedTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv-series';

  const TopRatedTVSeriesPage({Key? key}) : super(key: key);

  @override
  _TopRatedTVSeriesPageState createState() => _TopRatedTVSeriesPageState();
}

class _TopRatedTVSeriesPageState extends State<TopRatedTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TVSeriesTopRatedCubit>().get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TVSeriesTopRatedCubit, TVSeriesTopRatedState>(
          builder: (context, state) {
            if (state is TVSeriesTopRatedLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TVSeriesTopRatedLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TVSeriesCard(state.items[index]);
                },
                itemCount: state.items.length,
              );
            } else if (state is TVSeriesTopRatedErrorState) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const Center(child: Text("Failed to get data"));
            }
          },
        ),
      ),
    );
  }
}
