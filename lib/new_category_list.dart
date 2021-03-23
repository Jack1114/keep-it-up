import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dropdown_list.dart';

//Alert dialog for creating a new category
class NewCategoryList extends StatefulWidget {
  NewCategoryList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NewCategoryListState createState() => _NewCategoryListState();
}

class _NewCategoryListState extends State<NewCategoryList> {
  TextEditingController _textFieldController = TextEditingController();
  String valueText;

  void addCategoryItem() {
    setState(() {
      items.insert(0, _textFieldController.text);
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "New category"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  addCategoryItem();
                  setState(() {
                    //codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: new Color(0XFFF2F2F2)),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: new Color(0XFF77CFD9),
                ),
              ),
            ],
          );
        });
  }

  //Button for adding a new category
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        child: Text(
          'Add a new category',
          style: TextStyle(color: new Color(0XFFF2F2F2)),
        ),
        style: ElevatedButton.styleFrom(
          primary: new Color(0XFFF27052),
          onPrimary: new Color(0XFFF2F2F2),
          elevation: 3,
          shadowColor: new Color(0XFFF2C777),
        ));
  }
}
