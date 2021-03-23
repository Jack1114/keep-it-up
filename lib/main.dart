//import 'dart:html';

import 'package:MyVocabularyApp/word_list_widget.dart';
import 'package:flutter/material.dart';
import 'string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'add_word_widget.dart';
import 'word_list_widget.dart';

void main() {
  runApp(MyApp());
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$counter');
}

//HomePage classe
class MyApp extends StatelessWidget {
  // This widget is the root of your application
  Widget titleSection = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.appheadingTitle,
              style: TextStyle(
                color: new Color(0xFF77CFD9),
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ))
      ],
    ),
  );

  Widget learnPage = Container();

  Widget testPage = Container();

  //HomePage
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appBarTitle,
      theme: ThemeData(
        primaryColor: new Color(0XFF77CFD9),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Learn"),
                Tab(text: "Add"),
                Tab(text: "Test"),
                Tab(text: "List"),
              ],
              labelColor: new Color(0XFFF2F2F2),
            ),
            title: Text(
              Strings.appBarTitle,
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(children: <Widget>[
            learnPage,
            AddWordWidget(storage: WordStorage()),
            testPage,
            WordListWidget(),
          ]),
        ),
      ),
    );
  }
}
