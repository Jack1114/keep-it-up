//import 'dart:html';

import 'package:flutter/material.dart';
import 'string.dart';

void main() {
  runApp(MyApp());
}

List<String> items = <String>['1', '2', '3'];

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String selectedItem = '1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      elevation: 2,
      underline: Container(),
      onChanged: (String string) => setState(() => selectedItem = string),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((String item) {
          return Text(item);
        }).toList();
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          child: Text(item),
          value: item,
        );
      }).toList(),
    );
  }
}

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
              FlatButton(
                onPressed: () {
                  addCategoryItem();
                  setState(() {
                    //codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
                child: Text('OK'),
                color: new Color(0XFF77CFD9),
                textColor: new Color(0XFFF2F2F2),
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return RaisedButton(
      color: new Color(0XFFF27052),
      //splashColor: new Color(0XFFF2C777),
      highlightColor: new Color(0XFFF2C777),
      child: Text('Add a new category'),
      textColor: new Color(0XFFF2F2F2),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      onPressed: () {
        _displayTextInputDialog(context);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //titleSection widget
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

  Widget addPage = Column(
    children: <Widget>[
      Text('Add a new word'),
      TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Insert a new word in English',
        ),
      ),
      Text('Write the translation'),
      TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Insert the translation',
        ),
      ),
      Text('Choose a category'),
      DropDownList(),
      Text('Or create a new one'),
      NewCategoryList(),
      RaisedButton(
          color: new Color(0XFFF27052),
          //splashColor: new Color(0XFFF2C777),
          highlightColor: new Color(0XFFF2C777),
          child: Icon(
            Icons.check,
            color: new Color(0XFFF2F2F2),
          ),
          textColor: new Color(0XFFF2F2F2),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          onPressed: () {}),
    ],
  );

  Widget learnPage = Container();

  Widget testPage = Container();

  Widget listPage = Container();

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
            addPage,
            testPage,
            listPage,
          ]),
        ),
      ),
    );
  }
}
