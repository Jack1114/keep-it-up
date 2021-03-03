import 'package:flutter/material.dart';
import 'string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  String valueChoose;
  List categoryItem = ["Category 1", "Category 2", "Category 3"];

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
                color: new Color(0xFF4E8585),
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
      DropdownButton(
        hint: Text("Choose a category"),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 30,
        value: valueChoose,
      )
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
        primaryColor: new Color(0xFF4E8585),
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
