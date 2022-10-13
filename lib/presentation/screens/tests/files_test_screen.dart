import 'dart:io';

import 'package:flutter/material.dart';
import 'package:speakyfox/data/remote/file_client.dart';
//import 'package:image/image.dart' as img;

class FilesTestScreen extends StatefulWidget {
  const FilesTestScreen({Key? key}) : super(key: key);

  @override
  State<FilesTestScreen> createState() => _FilesTestScreenState();
}

class _FilesTestScreenState extends State<FilesTestScreen> {
  final FileClient2 fileClient = FileClient2(baseUrl: "https://speakyfox-api-qa.herokuapp.com/api/v1/", path: "files/");

  Widget? myWidget; 

  File? file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  void getFile() async {
    try {
      fileClient.getFileById("65819ea5-f68f-47cb-aa51-133d6052f7a6").then((value) {
        myWidget = Image.memory(value.data!);
        setState(() {});
      });
    } catch (e) {
      myWidget = Text("Error! $e");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build()");
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getFile),
      appBar: AppBar(title: const Text("test")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          AnimatedScale(
            scale: myWidget != null ? 1.0 : 0,
            duration: const Duration(seconds: 1),
            child: myWidget,
          ),
          
        ],
      )),
    );
  }
}
