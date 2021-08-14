import 'package:flutter_test/flutter_test.dart';
import 'package:poe_characters/api/api.provider.dart';
import 'package:poe_characters/utils/constants/api_endpoints.const.dart';
import 'package:poe_characters/utils/exceptions/api.exception.dart';

void main() {
  group('testing provider', () {
    test('api request to non-restricted endpoint without auth token', () async {
      final response =
          await makeApiRequest('/ninja?type=Currency&league=Expedition');
      expect(response.length, greaterThan(500));
    });
    test('api request to restricted endpoint with invalid auth token',
        () async {
      await expectLater(
          makeApiRequest(FETCH_ALL_CHARACTERS, authToken: 'invalid'),
          throwsA(isA<ApiException>()));
    });
    test('api request to restricted endpoint with valid auth token', () async {
      // This authToken is safe to display publically
      final response = await makeApiRequest(FETCH_ALL_CHARACTERS,
          authToken:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwb250dXMiLCJleHAiOjE2MjkwMzY2NzB9.gUo6cP84KjrFYdJ43bA8x-hukKemjzqsU0yCu0P4OOA');
      expect(response.length, greaterThan(100));
    });
  });
}
