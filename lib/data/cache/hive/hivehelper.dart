
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  //initialize in main file
  static Future<void> initialHive() async {
    await Hive.initFlutter();
  }

  static createHivebox({
    // create new hive box
    required String boxname,
  }) async {
    await Hive.openBox(boxname);
  }

  static readHiveBox(
      {required dynamic namedBox, required dynamic getterName}) async {
    var box = await Hive.openBox(namedBox);
    var res = box.get(getterName);
    return res;
  }

  static writeOneHiveBox({
    required String namedBox,
    required String key,
    required dynamic value,
  }) async {
    var box = await Hive.openBox(namedBox);
    // var box = Hive.box(namedBox);
    box.put(key, value);
  }

  static writeHiveBox(
      {required String namedBox, required Map<String, dynamic> map}) async {
    var box = await Hive.openBox(namedBox);
    box.putAll(map);
  }

  static deleteOneHiveBox({
    required String namedBox,
    required String key,
  }) async {
    var box = await Hive.openBox(namedBox);
    box.delete(key);
  }

  static deleteHiveBox(
      {required String namedBox, required Iterable<dynamic> keysmap}) async {
    var box = await Hive.openBox(namedBox);
    box.deleteAll(keysmap);
  }
}
