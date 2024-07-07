import 'package:bdcallingtask/controller/controller.dart';
import 'package:bdcallingtask/json/jsonInput1.dart';
import 'package:bdcallingtask/json/jsonInput2.dart';
import 'package:bdcallingtask/model/android_version.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JsonParserScreen(),
    );
  }
}

class JsonParserScreen extends StatefulWidget {
  const JsonParserScreen({super.key});

  @override
  State<JsonParserScreen> createState() => _JsonParserScreenState();
}

class _JsonParserScreenState extends State<JsonParserScreen> {
  void showJson1(BuildContext context) {
    final data = Controller.parseJson(Jsoninput1.jsonInput1);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Parsed JSON 1"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                data.map((list) => Text('${list.title.toString()} ')).toList(),
          ),
        ),
      ),
    );
  }

  void showJson2(BuildContext context) {
    final data = Controller.parseJson(Jsoninput2.jsonInput2);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Parsed JSON 2"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data
                .map((version) => Text('${version.title} (ID: ${version.id})'))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Flutter JSON Task")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => showJson1(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    " Output 1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => showJson2(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    " Output 2",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// List<AndroidVersion> parseJson(String jsonData) {
//   final List<AndroidVersion> lists = [];
//   final data = json.decode(jsonData);

//   for (var item in data) {
//     if (item is Map) {
//       for (var list in item.values) {
//         lists.add(AndroidVersion(id: list['id'], title: list['title']));
//       }
//     } else if (item is List) {
//       for (var list in item) {
//         lists.add(AndroidVersion(id: list['id'], title: list['title']));
//       }
//     }
//   }
//   return lists;
// }
