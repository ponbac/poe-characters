import 'package:http/http.dart';

const String _baseUri = 'https://api.backman.app/';

Future<String> makeApiRequest(String query) async {
  final request = await get(
    Uri.parse('$_baseUri$query'),
    headers: {'Content-Type': 'application/json'},
  );

  print(request);

  // if (request.statusCode != 200) {
  //   throw ApiException(request.statusCode, request.body);
  // }
  return request.body;
}
