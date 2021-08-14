import 'package:flutter_test/flutter_test.dart';
import 'package:poe_characters/api/models/character.model.dart';
import 'package:poe_characters/api/repositories/character.repository.dart';

void main() {
  late CharacterRepository repository;
  setUp(() => {repository = CharacterRepository.instance()});
  group('testing character repository', () {
    test('testing fetching all characters', () async {
      // This token is okay to display in public
      List<Character> characters = await repository.fetchAllCharacters(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwb250dXMiLCJleHAiOjE2MjkwMzY2NzB9.gUo6cP84KjrFYdJ43bA8x-hukKemjzqsU0yCu0P4OOA');
      expect(characters.length, greaterThan(0));
    });
  });
}
