import 'package:hafizh/core/hive/hive_service.dart';
import 'package:hive/hive.dart';

class BaseHiveBox<T> {
  Future<void> init() async {
    box = await openBox();
  }

  late Box<T> box;

  bool get closed => !box.isOpen;

  Future<Box<T>> openBox() {
    return Hive.openBox<T>(hiveBoxNames[T] ?? '');
  }

  Box<T> getBox() {
    return Hive.box<T>(hiveBoxNames[T] ?? '');
  }

  T? getSingle({
    required String id,
  }) {
    final box = getBox();
    return box.get(id);
  }

  List<T>? getAll() {
    final box = getBox();
    return box.values.toList();
  }

  Stream<List<T>> get stream {
    return box.watch().map((e) => box.values.toList());
  }

  Future<void> putItem({
    required String id,
    required T item,
  }) {
    final box = getBox();
    return box.put(id, item);
  }

  Future<void> deleteItem({
    required String id,
  }) {
    final box = getBox();
    return box.delete(id);
  }

  Future<void> deleteAll() {
    final box = getBox();
    return box.deleteAll(box.keys);
  }
}
