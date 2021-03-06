import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionToggle extends StatefulWidget {
  TransactionToggle({this.children}) {
    _isSelected = List.generate(children.length, (index) => false);
  }
  final List<Widget> children;
  List<bool> _isSelected;
  @override
  _TransactionToggleState createState() => _TransactionToggleState();
}

class _TransactionToggleState extends State<TransactionToggle> {
  @override
  Widget build(BuildContext context) {
    var children = widget.children;
    var _isSelected = widget._isSelected;
    return Center(
      child: ToggleButtons(
        children: children,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                if (!_isSelected[index]) _isSelected[buttonIndex] = true;
              } else {
                _isSelected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: _isSelected,
        borderRadius: BorderRadius.circular(10),
        selectedColor: Color(0xFFEDF3F8),
        fillColor: Colors.purple,
        borderColor: Colors.purple,
        selectedBorderColor: Colors.purple,
        borderWidth: 3,
        splashColor: Colors.purple[100],
        constraints: BoxConstraints.expand(
            width:
                MediaQuery.of(context).size.width / (1.2 * _isSelected.length),
            height: 60),
      ),
    );
  }
}
