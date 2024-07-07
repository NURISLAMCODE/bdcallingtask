import 'dart:convert';

import 'package:bdcallingtask/json/jsonInput1.dart';
import 'package:bdcallingtask/json/jsonInput2.dart';
import 'package:bdcallingtask/model/android_version.dart';
import 'package:flutter/material.dart';

class Controller {
  static List<AndroidVersion> parseJson(String jsonData) {
    final List<AndroidVersion> lists = [];
    final data = json.decode(jsonData);

    for (var item in data) {
      if (item is Map) {
        for (var list in item.values) {
          lists.add(AndroidVersion(
              id: list['id'], title: list['title'].toString().trim()));
        }
      } else if (item is List) {
        for (var list in item) {
          lists.add(AndroidVersion(id: list['id'], title: list['title']));
        }
      }
    }
    return lists;
  }
}
