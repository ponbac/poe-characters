import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:poe_characters/api/api.provider.dart';
import 'package:poe_characters/api/models/character.model.dart';
import 'package:poe_characters/utils/constants/api_endpoints.const.dart';
import 'package:poe_characters/utils/exceptions/api.exception.dart';

class CharacterRepository {
  static final CharacterRepository _instance = CharacterRepository._();

  CharacterRepository._();
  factory CharacterRepository.instance() => _instance;

  Future<List<Character>> fetchAllCharacters(String token) async {
    final String rawRequest =
        await makeApiRequest(FETCH_ALL_CHARACTERS, authToken: token);

    return compute<String, List<Character>>(
        _parseFetchAllCharacters, rawRequest);
  }
}

Future<List<Character>> _parseFetchAllCharacters(String rawRequest) async {
  try {
    final request = json.decode(rawRequest) as Map<String, dynamic>;
    final characters = (request['characters'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map((element) => Character.fromJson(element))
        .toList();
    return characters;
  } on ApiException catch (e) {
    print(e.toString());
    return <Character>[];
  }
}
