import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/tv_series_airing_today_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';

class AiringTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-tv-series';

  const AiringTVSeriesPage({Key? key}) : super(key: key);

  @override
  _AiringTVSeriesPageState createState() => _AiringTVSeriesPageState();
}

class _AiringTVSeriesPageState extends State<AiringTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TVSeriesAiringTodayCubit>().get());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TVSeriesAiringTodayCubit, TVSeriesAiringTodayState>(
          builder: (context, state) {
            if (state is TVSeriesAiringTodayLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TVSeriesAiringTodayLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TVSeriesCard(state.items[index]);
                },
                itemCount: state.items.length,
              );
            } else if (state is TVSeriesAiringTodayError) {
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
