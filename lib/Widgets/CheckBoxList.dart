import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxList extends StatefulWidget {
  CheckBoxList({this.children}) {
    this.values = List.generate(children.length, (index) => false);
  }
  final List<String> children;
  // final int count;
  List<bool> values;
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  @override
  Widget build(BuildContext context) {
    var children = widget.children;
    var values = widget.values;
    return Column(
        children: children.map((element) {
      int index = children.indexOf(element);
      return CheckboxListTile(
        activeColor: Colors.purple,
        title: Text(
          element,
          style: TextStyle(fontSize: 20),
        ),
        value: values[index],
        onChanged: (bool value) {
          setState(() {
            values[index] = value;
          });
        },
      );
    }).toList());
  }
}
