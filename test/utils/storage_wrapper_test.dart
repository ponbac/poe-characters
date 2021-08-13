import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:poe_characters/utils/storage_wrapper.dart';

void main() {
  late StorageWrapper storage;
  setUp(() async {
    Hive.init('test/hive_storage');
    storage = StorageWrapper.instance();
  });
  group('testing storage wrapper', () {
    test('testing saving and retrieving data from hive box', () async {
      storage.persistData('number', 33);
      int result = await storage.retrieveData('number');
      expect(result, 33);
    });
    test('testing saving and deleting data from hive box', () async {
      storage.persistData('number', 33);
      storage.deleteData('number');
      int? result = await storage.retrieveData('number');
      expect(result, isNull);
    });
  });
}
