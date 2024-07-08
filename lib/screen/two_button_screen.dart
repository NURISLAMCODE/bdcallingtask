import 'package:bdcallingtask/json/input1.dart';
import 'package:bdcallingtask/json/input2.dart';
import 'package:bdcallingtask/model/android_version_model.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flutter JSON Task")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  List<List<AndroidVersion?>> sections =
                      Controller.parseJsonM1(Input1.input1);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OutputScreen(sections: sections),
                    ),
                  );
                },
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
                onPressed: () {
                  List<List<AndroidVersion?>> sections =
                      Controller.parseJsonM1(Input2.input2);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OutputScreen(sections: sections),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
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

class OutputScreen extends StatelessWidget {
  final List<List<AndroidVersion?>> sections;

  OutputScreen({required this.sections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: sections
      //         .expand((section) => section)
      //         .map((version) => Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text(
      //                 version?.title ?? '',
      //                 style: TextStyle(fontSize: 18),
      //               ),
      //             ))
      //         .toList(),
      //   ),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 18.0, // space between items
            runSpacing: 18.0, // space between rows
            children: sections
                .expand((section) => section)
                .map((version) => Chip(
                      label: Text(
                        version?.title ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
