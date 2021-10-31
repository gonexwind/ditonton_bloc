import 'dart:convert';

import 'package:ditonton/data/models/tv/tv_episode/tv_episode_model.dart';
import 'package:http/http.dart' as http;

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv/tv_detail/tv_detail_model.dart';
import 'package:ditonton/data/models/tv/tv_model.dart';

abstract class TVRemoteDataSource {
  Future<List<TVModel>> getAiringTodayTVSeries();
  Future<List<TVModel>> getPopularTVSeries();
  Future<List<TVModel>> getTopRatedTVSeries();
  Future<List<TVModel>> getRecommendationTVSeries(int id);
  Future<TVDetailResponse> getDetailTVSeries(int id);
  Future<List<TVModel>> searchTVSeries(String query);
  Future<List<EpisodeModel>> getEpisodeSeasonTVSeries({
    required int id,
    required int seasonNumber,
  });
}

class TVRemoteDataSourceImp implements TVRemoteDataSource {
  final http.Client client;

  TVRemoteDataSourceImp({
    required this.client,
  });

  @override
  Future<List<TVModel>> getAiringTodayTVSeries() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body)['results']) as List;
      return result.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getPopularTVSeries() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body)['results']) as List;
      return result.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getTopRatedTVSeries() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body)['results']) as List;
      return result.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TVDetailResponse> getDetailTVSeries(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      final body = Map<String, dynamic>.from(jsonDecode(response.body) as Map);
      final result = TVDetailResponse.fromJson(body);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> searchTVSeries(String query) async {
    final response = await client.get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body)['results']) as List;
      return result.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getRecommendationTVSeries(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      final result = (jsonDecode(response.body)['results']) as List;
      return result.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EpisodeModel>> getEpisodeSeasonTVSeries({
    required int id,
    required int seasonNumber,
  }) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id/season/$seasonNumber?$API_KEY'));

    if (response.statusCode == 200) {
      final list = (jsonDecode(response.body)['episodes']) as List;
      final result = list.map((e) => EpisodeModel.fromJson(e)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
