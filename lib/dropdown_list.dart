import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> items = <String>['1', '2', '3'];

//DropDown List for seeing the categories
class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String selectedItem = '0';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      elevation: 1,
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
