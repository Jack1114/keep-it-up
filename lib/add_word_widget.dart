import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class WordStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/words.txt');
  }

  Future<String> readWords() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return 'errore';
    }
  }

  Future<File> writeWords(String ita, String eng) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$ita;$eng');
  }
}

class AddWordWidget extends StatefulWidget {
  final WordStorage storage;

  const AddWordWidget({Key key, @required this.storage}) : super(key: key);

  @override
  _AddWordWidgetState createState() => _AddWordWidgetState();
}

class _AddWordWidgetState extends State<AddWordWidget> {
  final itaController = TextEditingController();
  final engController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    itaController.dispose();
    engController.dispose();
    super.dispose();
  }

  Future<File> _saveWords() {
    // Write the variable as a string to the file.
    return widget.storage.writeWords(itaController.text, engController.text);
  }

  //dialog to see saved words
  Future<void> _showSavedWordsDialog() async {
    String words = await widget.storage.readWords();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contenuto del file'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(words),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Add a new word'),

        TextField(
          controller: engController,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Insert a new word in English',
          ),
        ),

        Text('Write the translation'),

        TextField(
          controller: itaController,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Insert the translation',
          ),
        ),

        //Done Button (= saving words)
        ElevatedButton(
          child: Icon(
            Icons.check,
            color: new Color(0XFFF2F2F2),
          ),
          style: ElevatedButton.styleFrom(
            primary: new Color(0XFFF27052),
            onPrimary: new Color(0XFFF2F2F2),
            elevation: 3,
            shadowColor: new Color(0XFFF2C777),
          ),
          onPressed: _saveWords,
        ),

        ElevatedButton(onPressed: _showSavedWordsDialog, child: Text('Read')),
      ],
    );
  }
}
