// Mocks generated by Mockito 5.0.16 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i13;
import 'dart:typed_data' as _i14;

import 'package:core/core.dart' as _i10;
import 'package:core/utils/failure.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/models/movie_table.dart' as _i12;
import 'package:sqflite/sqflite.dart' as _i11;
import 'package:tv_series/domain/entities/tv.dart' as _i7;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i8;
import 'package:tv_series/domain/entities/tv_episode.dart' as _i9;
import 'package:tv_series/tv_series.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTVDetailResponse_1 extends _i1.Fake implements _i3.TVDetailResponse {
}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i3.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getAiringTodayTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getAiringTodayTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getRecommendationTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationTVSeries, [id]),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i8.TVDetail>> getDetailTVSeries(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVSeries, [id]),
              returnValue: Future<_i2.Either<_i6.Failure, _i8.TVDetail>>.value(
                  _FakeEither_0<_i6.Failure, _i8.TVDetail>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i8.TVDetail>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i9.Episode>>>
      getEpisodeSeasonTVSeries({int? id, int? seasonNumber}) => (super
              .noSuchMethod(
                  Invocation.method(
                      #getEpisodeSeasonTVSeries, [], {
                    #id: id,
                    #seasonNumber: seasonNumber
                  }),
                  returnValue:
                      Future<_i2.Either<_i6.Failure, List<_i9.Episode>>>.value(
                          _FakeEither_0<_i6.Failure, List<_i9.Episode>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i9.Episode>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> insertWatchlistTVSeries(
          _i8.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeWatchlistTVSeries(
          _i8.TVDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTVSeries, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlistTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTVSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TVRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRemoteDataSource extends _i1.Mock
    implements _i3.TVRemoteDataSource {
  MockTVRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.TVModel>> getAiringTodayTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getAiringTodayTVSeries, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.TVModel>> getRecommendationTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#getRecommendationTVSeries, [id]),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<_i3.TVDetailResponse> getDetailTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTVSeries, [id]),
              returnValue:
                  Future<_i3.TVDetailResponse>.value(_FakeTVDetailResponse_1()))
          as _i5.Future<_i3.TVDetailResponse>);
  @override
  _i5.Future<List<_i3.TVModel>> searchTVSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue: Future<List<_i3.TVModel>>.value(<_i3.TVModel>[]))
          as _i5.Future<List<_i3.TVModel>>);
  @override
  _i5.Future<List<_i3.EpisodeModel>> getEpisodeSeasonTVSeries(
          {int? id, int? seasonNumber}) =>
      (super.noSuchMethod(
              Invocation.method(#getEpisodeSeasonTVSeries, [],
                  {#id: id, #seasonNumber: seasonNumber}),
              returnValue:
                  Future<List<_i3.EpisodeModel>>.value(<_i3.EpisodeModel>[]))
          as _i5.Future<List<_i3.EpisodeModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [TVLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVLocalDataSource extends _i1.Mock implements _i3.TVLocalDataSource {
  MockTVLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertWatchlist(_i3.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeWatchlist(_i3.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [tv]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i3.TVLocalDatabaseModel?> getDataById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDataById, [id]),
              returnValue: Future<_i3.TVLocalDatabaseModel?>.value())
          as _i5.Future<_i3.TVLocalDatabaseModel?>);
  @override
  _i5.Future<List<_i3.TVLocalDatabaseModel>> getWatchlist() =>
      (super.noSuchMethod(Invocation.method(#getWatchlist, []),
              returnValue: Future<List<_i3.TVLocalDatabaseModel>>.value(
                  <_i3.TVLocalDatabaseModel>[]))
          as _i5.Future<List<_i3.TVLocalDatabaseModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i10.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i11.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i11.Database?>.value())
          as _i5.Future<_i11.Database?>);
  @override
  _i5.Future<int> insertWatchlist(_i12.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> insertWatchlistTVSeries(_i3.TVLocalDatabaseModel? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tv]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlist({int? id, String? table = r'watchlist'}) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlist, [], {#id: id, #table: table}),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getDataById(
          {int? id, String? table = r'watchlist'}) =>
      (super.noSuchMethod(
              Invocation.method(#getDataById, [], {#id: id, #table: table}),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlist(
          {String? table = r'watchlist'}) =>
      (super.noSuchMethod(Invocation.method(#getWatchlist, [], {#table: table}),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i13.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i14.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i14.Uint8List>.value(_i14.Uint8List(0)))
          as _i5.Future<_i14.Uint8List>);
  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i5.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
