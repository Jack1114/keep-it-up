import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_word_widget.dart';

class WordListWidget extends StatefulWidget {
  final WordStorage storage;
  const WordListWidget({Key key, @required this.storage}) : super(key: key);

  @override
  _WordListWidgetState createState() => _WordListWidgetState();
}

class _WordListWidgetState extends State<WordListWidget> {
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ElevatedButton(onPressed: _showSavedWordsDialog, child: Text('Read')),
    ]);
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
}
