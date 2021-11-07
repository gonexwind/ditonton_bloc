import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SSL Pinning Http ', () {
    test(
      'Should get response 200 when success connect',
      () async {
        final _client = await Shared.createLEClient(isTestMode: true);
        final response = await _client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));
        expect(response.statusCode, 200);
        _client.close();
      },
    );
  });
}
