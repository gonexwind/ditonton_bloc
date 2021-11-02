import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:core/utils/exception.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/data/models/tv_episode_model.dart';
import 'package:tv_series/data/models/tv_model.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TVRemoteDataSourceImp dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TVRemoteDataSourceImp(client: mockHttpClient);
  });

  group(
    'get Airing Today TV Series',
    () {
      final list =
          (jsonDecode(readJson('dummy_data/tv_airing_today.json'))['results'])
              as List;
      final listTVSeries = list
          .map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

      test(
        'should return list of TV Model when the response code is 200',
        () async {
          // arrange
          when(mockHttpClient
                  .get(Uri.parse('$BASE_URL/airing_today?$API_KEY')))
              .thenAnswer(
            (_) async => http.Response(
                readJson('dummy_data/tv_airing_today.json'), 200,
                headers: {
                  HttpHeaders.contentTypeHeader:
                      'application/json; charset=utf-8',
                }),
          );
          // act
          final result = await dataSource.getAiringTodayTVSeries();
          // assert
          expect(result, equals(listTVSeries));
        },
      );

      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // arrange
          when(mockHttpClient
                  .get(Uri.parse('$BASE_URL/airing_today?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getAiringTodayTVSeries();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        },
      );
    },
  );

  group('get popular tv series', () {
    final list =
        (jsonDecode(readJson('dummy_data/tv_popular.json'))['results']) as List;
    final listTVSeries = list
        .map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    test(
      'should return list of TV Model when the response code is 200',
      () async {
        //arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/popular?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response(
              readJson('dummy_data/tv_popular.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        //act
        final result = await dataSource.getPopularTVSeries();
        //assert
        expect(result, equals(listTVSeries));
      },
    );

    test(
      'should throw ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/popular?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getPopularTVSeries();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get top rated tv series', () {
    final list =
        (jsonDecode(readJson('dummy_data/tv_top_rated.json'))['results'])
            as List;
    final listTVSeries = list
        .map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    test(
      'should return list of tv when response code is 200',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/top_rated?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response(
              readJson('dummy_data/tv_top_rated.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        // act
        final result = await dataSource.getTopRatedTVSeries();
        // assert
        expect(result, equals(listTVSeries));
      },
    );

    test(
      'should throw ServerException when the response code is 400 or other',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/top_rated?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // act
        final call = dataSource.getTopRatedTVSeries();

        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('search TV Series', () {
    const query = 'your lie in april';

    final list =
        (jsonDecode(readJson('dummy_data/tv_search.json'))['results']) as List;
    final listTVSeries = list
        .map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    test(
      'should return list of tv when response code is 200',
      () async {
        //arrange
        when(mockHttpClient
                .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query')))
            .thenAnswer(
          (_) async => http.Response(readJson('dummy_data/tv_search.json'), 200,
              headers: {
                // Use this header when you get error Invalid String contain when decode json ...
                // Reference to this [https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language/52993623#52993623]
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        //act
        final result = await dataSource.searchTVSeries(query);
        //assert
        expect(result, equals(listTVSeries));
      },
    );

    test(
      'should throw ServerException when response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient
                .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query')))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.searchTVSeries(query);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get recommendation TV Series', () {
    const id = 61663;

    final list =
        (jsonDecode(readJson('dummy_data/tv_recommendation.json'))['results'])
            as List;
    final listTVSeries = list
        .map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    test(
      'should return list of tv when response code is 200',
      () async {
        // arrange
        when(mockHttpClient
                .get(Uri.parse('$BASE_URL/$id/recommendations?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response(
              readJson('dummy_data/tv_recommendation.json'), 200,
              headers: {
                // Use this header when you get error Invalid String contain when decode json ...
                // Reference to this [https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language/52993623#52993623]
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        // act
        final result = await dataSource.getRecommendationTVSeries(id);
        // assert
        expect(result, equals(listTVSeries));
      },
    );

    test(
      'should throw ServerException when response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient
                .get(Uri.parse('$BASE_URL/$id/recommendations?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getRecommendationTVSeries(id);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get episode of season TV Series', () {
    const id = 61663;
    const seasonNumber = 1;

    final list =
        (jsonDecode(readJson('dummy_data/tv_episode_season.json'))['episodes'])
            as List;
    final listEpisodeSeasonTVSeries = list
        .map((e) => EpisodeModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    test(
      'should return list episode of season when response code is 200',
      () async {
        //arrange
        when(mockHttpClient.get(
                Uri.parse('$BASE_URL/$id/season/$seasonNumber?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response(
              readJson('dummy_data/tv_episode_season.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        //act
        final result = await dataSource.getEpisodeSeasonTVSeries(
          id: id,
          seasonNumber: seasonNumber,
        );
        //assert
        expect(result, equals(listEpisodeSeasonTVSeries));
      },
    );

    test(
      'should throw ServerException when response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(
                Uri.parse('$BASE_URL/$id/season/$seasonNumber?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSource.getEpisodeSeasonTVSeries(
            id: id, seasonNumber: seasonNumber);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('get Detail TV Series', () {
    const id = 61663;

    final tvDetail = TVDetailResponse.fromJson(
      jsonDecode(readJson('dummy_data/tv_detail.json')),
    );

    test(
      'should return tv detail when the response code is 200',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/$id?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response(readJson('dummy_data/tv_detail.json'), 200,
              headers: {
                // Use this header when you get error Invalid String contain when decode json ...
                // Reference to this [https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language/52993623#52993623]
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }),
        );
        // act
        final result = await dataSource.getDetailTVSeries(id);
        // assert
        expect(result, equals(tvDetail));
      },
    );

    test(
      'should throw ServerException when the response code is 400 or other',
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse('$BASE_URL/$id?$API_KEY')))
            .thenAnswer(
          (_) async => http.Response('Not Found', 404, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }),
        );
        // act
        final call = dataSource.getDetailTVSeries(id);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}
