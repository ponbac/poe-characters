import 'package:http/http.dart';
import 'package:poe_characters/utils/constants/api_endpoints.const.dart';
import 'package:poe_characters/utils/exceptions/api.exception.dart';

const String _baseUrl = BASE_URL;

Future<String> makeApiRequest(String query, {String? authToken}) async {
  final request = await get(Uri.parse('$_baseUrl$query'), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${authToken ?? 'NONE'}'
  });

  if (request.statusCode != 200) {
    throw ApiException(request.statusCode, request.body);
  }

  return request.body;
}
