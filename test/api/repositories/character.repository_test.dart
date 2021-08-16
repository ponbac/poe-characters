import 'package:flutter_test/flutter_test.dart';
import 'package:poe_characters/api/models/character.model.dart';
import 'package:poe_characters/api/repositories/character.repository.dart';
import 'package:poe_characters/utils/constants/api_endpoints.const.dart';

void main() {
  late CharacterRepository repository;
  setUp(() => {repository = CharacterRepository.instance()});
  group('testing character repository', () {
    test('testing fetching all characters', () async {
      // This token is okay to display in public
      List<Character> characters =
          await repository.fetchAllCharacters(TEST_TOKEN);
      expect(characters.length, greaterThan(0));
    });
  });
}
