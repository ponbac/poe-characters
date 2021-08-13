import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:poe_characters/utils/storage.utils.dart';

void main() {
  Hive.init('test/hive_storage');

  group('testing storage', () {
    test('testing saving and retrieving data from hive box', () async {
      persistData('number', 33);
      int result = await retrieveData('number');
      expect(result, 33);
    });
    test('testing saving and deleting data from hive box', () async {
      persistData('number', 33);
      deleteData('number');
      int? result = await retrieveData('number');
      expect(result, isNull);
    });
  });
}
