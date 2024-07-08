import 'dart:convert';

import 'package:bdcallingtask/model/android_version_model.dart';

class Controller {
  static List<List<AndroidVersion?>> parseJsonM1(String jsonString) {
    var jsonData = json.decode(jsonString);

    List<List<AndroidVersion?>> sections = [];

    jsonData.forEach((item) {
      if (item is Map<String, dynamic>) {
        int maxIndex = 0;
        item.forEach((key, value) {
          int index = int.tryParse(key) ?? 0;
          if (index > maxIndex) maxIndex = index;
        });

        List<AndroidVersion?> androidVersions =
            List.filled(maxIndex + 1, null, growable: true);

        item.forEach((key, value) {
          int index = int.tryParse(key) ?? 0;
          androidVersions[index] = AndroidVersion(
            id: value['id'],
            title: value['title'],
          );
        });

        sections.add(androidVersions);
      } else if (item is List) {
        List<AndroidVersion?> androidVersions =
            item.map<AndroidVersion?>((value) {
          return AndroidVersion(
            id: value['id'],
            title: value['title'],
          );
        }).toList();

        sections.add(androidVersions);
      }
    });

    return sections;
  }
}
