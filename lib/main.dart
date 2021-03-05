import 'package:flutter/material.dart';
import 'string.dart';

void main() {
  runApp(MyApp());
}

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  final List<String> items = <String>['1', '2', '3'];
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

Widget createNewCategory = FlatButton(
  color: Colors.black,
  child: Text('Add a new category'),
  textColor: Colors.white,
  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  onPressed: () {},
);

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
      DropDownList(),
      Text('Or create a new one'),
      createNewCategory,
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
