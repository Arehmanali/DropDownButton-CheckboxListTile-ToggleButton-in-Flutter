import 'Widgets/CheckBoxList.dart';
import 'Widgets/TransactionToggle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort And Filter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Newest First';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      onChanged: (String value) {
        setState(() {
          dropdownValue = value;
        });
      },
      style: TextStyle(fontSize: 18, color: Colors.black),
      isExpanded: true,
      items:
          ['Newest First', 'Oldest First', 'Value High-Low', 'Value Low-High']
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
      underline: Container(
        height: 3,
        color: Colors.purple,
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // List of widgets in the drawer

    return Scaffold(
      appBar: AppBar(
        title: Text('Sort & Filter'),
        leading: Icon(Icons.cancel),
        backgroundColor: Colors.purple,
        actions: [
          TextButton(
            child: Text(
              'CLEAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text('APPLY', style: TextStyle(color: Colors.white)),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              elevation: 10,
              color: Color(0xFFEDF3F8),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sort by',
                      style: TextStyle(fontSize: 30),
                    ),
                    DropDown()
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFFEDF3F8),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Transaction Types',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TransactionToggle(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://user-images.githubusercontent.com/55204040/116055305-0094f780-a696-11eb-87a4-91bc8a2d217e.png",
                            fit: BoxFit.fitWidth,
                            width: 35,
                          ),
                          Text('Money In'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://user-images.githubusercontent.com/55204040/116055200-e529ec80-a695-11eb-9233-b8814943ecb8.png',
                            fit: BoxFit.fitWidth,
                            width: 35,
                          ),
                          Text('Money Out'),
                        ],
                      ),
                    ])
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFFEDF3F8),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    CheckBoxList(
                      children: [
                        'Sale',
                        'Credit',
                        'Refund',
                        'Loan',
                        'Direct Material',
                        'Direct labour',
                        'Asset',
                        'Other',
                        'Over head',
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFFEDF3F8),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Transaction Health',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TransactionToggle(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.recommend,
                              color: Colors.green,
                              size: 30,
                            ),
                            Text('Good'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_down,
                              color: Colors.yellow[800],
                              size: 30,
                            ),
                            Text('Ok'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_down,
                              color: Colors.red[600],
                              size: 30,
                            ),
                            Text('Bad'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFFEDF3F8),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    CheckBoxList(
                      children: [
                        'Consultant Notes Only',
                        'Overdue Only',
                        'Date Range',
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 20),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Expanded(
                                child: TextFormField(
                                  enabled: true,
                                  decoration: InputDecoration(
                                    labelText: 'From',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                        width: 3,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                  initialValue: '-',
                                  keyboardType: TextInputType.datetime,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              new Expanded(
                                child: TextFormField(
                                  enabled: true,
                                  decoration: InputDecoration(
                                    labelText: 'To',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                        width: 3,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                  initialValue: 'Today',
                                  keyboardType: TextInputType.datetime,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
