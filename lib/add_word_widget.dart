import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddWordWidget extends StatefulWidget {
  const AddWordWidget({Key key}) : super(key: key);

  @override
  _AddWordWidgetState createState() => _AddWordWidgetState();
}

class _AddWordWidgetState extends State<AddWordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          onPressed: () {},
        ),
      ],
    );
  }
}
