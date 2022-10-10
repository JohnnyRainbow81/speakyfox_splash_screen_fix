import 'dart:io';

import 'package:flutter/material.dart';
import 'package:speakyfox/data/remote/file_client_2.dart';
import 'package:image/image.dart' as img;

class FilesTestScreen extends StatefulWidget {
  const FilesTestScreen({Key? key}) : super(key: key);

  @override
  State<FilesTestScreen> createState() => _FilesTestScreenState();
}

class _FilesTestScreenState extends State<FilesTestScreen> {
  final FileClient2 fileClient = FileClient2(baseUrl: "https://speakyfox-api-qa.herokuapp.com/api/v1/", path: "files/");

  Widget myWidget = const CircularProgressIndicator.adaptive();

  img.Image? image;
  File? file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  void getFile() async {
    try {
      final response = await fileClient.getFileById("65819ea5-f68f-47cb-aa51-133d6052f7a6");
      image = img.decodeImage(response.data.stream);
      File('myImage').writeAsBytes(img.encodePng(image!)).then((value) {
        file = value;
        myWidget = SizedBox(height: 200, width: 200, child: Image.file(file!));
        setState(() {});
      });
    } catch (e) {
      myWidget = Text("Error! $e");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getFile),
      appBar: AppBar(title: Text("test")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          myWidget,
          Image.network("https://speakyfox-api-qa.herokuapp.com/api/v1/files/65819ea5-f68f-47cb-aa51-133d6052f7a6",)
        ],
      )),
    );
  }
}
