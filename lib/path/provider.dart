import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Prov extends StatefulWidget {
  const Prov({super.key});

  @override
  State<Prov> createState() => _ProvState();
}

class _ProvState extends State<Prov> {
  final textController = TextEditingController();
  String text = "";

  Future<void> createFile(String text) async {
//provides directory path.
    final directory = await getApplicationDocumentsDirectory();
//creates text_file in the provided path.
    final file = File('${directory.path}/text_file.txt');
    await file.writeAsString(text);
  }

  Future<void> readFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/text_file.txt');
      text = await file.readAsString();
    } catch (e) {
      print('exception');
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Path_Provider Example")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center, //input aligns to center
              controller: textController, //assigns TextEditingController
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Text('Create File'),
            onPressed: () => createFile(
                textController.text), //calls createFile() when //button pressed
          ),
          ElevatedButton(
            onPressed: () async {
              await readFile(); //calls readFile()
              setState(() {}); //rebuilds the UI.
            },
            child: Text('Read File'),
          ),
          const SizedBox(
            height: 18,
          ),
          if (text != null) Text('$text') //text set if it's not null.
        ],
      ),
    );
  }
}
