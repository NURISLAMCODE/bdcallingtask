import 'package:bdcallingtask/json/input1.dart';
import 'package:bdcallingtask/json/input2.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  static void showJson1Button(BuildContext context) {
    final data = Controller.parseJsonM1(Input1.input1);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(" JSON Output 1"),
        content: Container(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3, // Adjusts height to show text properly
            ),
            itemBuilder: (context, index) {
              final version = data[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${version.title}'),
              );
            },
          ),
        ),
      ),
    );
  }

  static void showJson2Button(BuildContext context) {
    final data = Controller.parseJsonM1(Input2.input2);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(" JSON Output 2"),
        content: Container(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3, // Adjusts height to show text properly
            ),
            itemBuilder: (context, index) {
              final version = data[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${version.title}'),
              );
            },
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => showJson1Button(context),
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
                onPressed: () => showJson2Button(context),
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
    );
  }
}
