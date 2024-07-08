import 'dart:convert';

import 'package:bdcallingtask/model/android_version_model.dart';

class Controller {
  static List<AndroidVersion> parseJsonM1(String jsonData) {
    final List<AndroidVersion> lists = [];
    final data = json.decode(jsonData);

    for (var item in data) {
      if (item is Map) {
        item.values.forEach((value) {
          lists.add(AndroidVersion(id: value['id'], title: value['title']));
        });
        // for (var list in item.values) {
        //   lists.add(AndroidVersion(
        //       id: list['id'], title: list['title'].toString().trim()));
        // }
      } else if (item is List) {
        item.forEach((value) {
          lists.add(AndroidVersion(id: value['id'], title: value['title']));
        });
      }
    }
    return lists;
  }
}
