import 'package:flutter_test/flutter_test.dart';
import 'package:poe_characters/api/api.provider.dart';

void main() {
  group('testing provider', () {
    test('should return raw character data', () async {
      final response = await makeApiRequest('ninja/?type=Currency&league=Expedition');
      //print(response);
      expect(response.isNotEmpty, true);
    });
  });
}
