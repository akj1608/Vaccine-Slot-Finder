import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.teal),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pincodeController = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Vaccine Slot Finder'))),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 250,
                  child: Image.asset('assets/vaccine.png'),
                ),
                TextField(
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: 'Enter your PIN Code',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child:TextField(
                        controller:daycontroller,
                        decoration: InputDecoration(hintText: 'Enter the day'),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08',
                      '09',
                      '10',
                      '11',
                      '12'
                    ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
                    ),
                  ],
                )
                
              ] ),
          ),
        ));
  }
}
