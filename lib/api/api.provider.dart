import 'package:http/http.dart';
import 'package:poe_characters/utils/exceptions/api.exception.dart';

const String _baseUri = 'https://api.backman.app/';

Future<String> makeApiRequest(String query, {String? authToken}) async {
  final request = await get(Uri.parse('$_baseUri$query'), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${authToken ?? 'NONE'}'
  });

  if (request.statusCode != 200) {
    throw ApiException(request.statusCode, request.body);
  }

  return request.body;
}
