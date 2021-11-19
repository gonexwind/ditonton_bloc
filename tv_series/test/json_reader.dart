import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('/tv_series') || dir.endsWith('\\tv_series')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/movies/test/$name').readAsStringSync();
}