import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';

class AiringTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-tv-series';

  @override
  _AiringTVSeriesPageState createState() => _AiringTVSeriesPageState();
}

class _AiringTVSeriesPageState extends State<AiringTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<TVSeriesCubit>(context, listen: false)
            .getAiringTodayTVSeries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TV Series'),
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
                  final tvSeries = state.airingTodayTVSeries[index];
                  return TVSeriesCard(tvSeries);
                },
                itemCount: state.airingTodayTVSeries.length,
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
