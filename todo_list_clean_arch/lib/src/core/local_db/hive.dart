import 'dart:io';
import 'package:hive/hive.dart';


class HiveDb  {
  static final HiveDb _hiveDb = HiveDb._internal();

  factory HiveDb() {
    return _hiveDb;
  }

  HiveDb._internal();


  Future<void> initDb() async {
    var path = Directory.current.path;
    Hive.init(path);
  }

  Future<dynamic> createBox({required String boxName}) async {
    return await Hive.openBox(boxName);
  }

  Box getBox(String boxName) => Hive.box(boxName);

      closeBox(String boxName) => Hive.close();
}
