import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_popular_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';

class PopularTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  const PopularTVSeriesPage({Key? key}) : super(key: key);

  @override
  _PopularTVSeriesPageState createState() => _PopularTVSeriesPageState();
}

class _PopularTVSeriesPageState extends State<PopularTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TVSeriesPopularCubit>().get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TVSeriesPopularCubit, TVSeriesPopularState>(
          builder: (context, state) {
            if (state is TVSeriesPopularLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TVSeriesPopularLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TVSeriesCard(state.items[index]);
                },
                itemCount: state.items.length,
              );
            } else if (state is TVSeriesPopularErrorState) {
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
