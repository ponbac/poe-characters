import 'package:hive/hive.dart';

Future<Box> _getBox(String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    return await Hive.openBox(boxName);
  }

  return Hive.box(boxName);
}

void persistData<T>(String id, T data) async {
  Box box = await _getBox(id);
  box.put(id, data);
}

void deleteData(String id) async {
  Box box = await _getBox(id);
  box.delete(id);
}

Future<T> retrieveData<T>(String id) async {
  Box box = await _getBox(id);
  return box.get(id);
}
