import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flite Booking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _chosenValue = "Select Location";
  String? from;
  String? to;
  String? plan;
  int desti1 = 0;
  int desti = 0;
  int finaldesti = 0;
  int planDesti = 0;
  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime end = DateTime.now();
  String? doneDate;
  String? enddate;
  String? select;
  bool show = false;
  bool book = false;
  int sPlan = 0;

  Future<void> _selectDate(BuildContext context) async {
    if(finaldesti==1){
      end = DateTime.now();
    }
    else{
    end = DateTime.now().add(Duration(days: planDesti.abs()-finaldesti.abs()));}
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: now,
        lastDate: end);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        select = DateFormat('dd-MMMM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: Colors.blue,
                    value: from,
                    // elevation: 15,
                    style: TextStyle(color: Colors.black),
                    items: <String>[
                      "Location 1",
                      "Location 2",
                      "Location 3",
                      "Location 4",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Select Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        from = value!;
                        if (value == "Location 1") {
                          desti1 = 1;
                        } else if (value == "Location 2") {
                          desti1 = 2;
                        } else if (value == "Location 3") {
                          desti1 = 3;
                        } else {
                          desti1 = 4;
                        }
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "To : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: Colors.blue,
                    value: to,
                    // elevation: 15,
                    style: TextStyle(color: Colors.black),
                    items: <String>[
                      "Location 1",
                      "Location 2",
                      "Location 3",
                      "Location 4",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Select Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        to = value!;
                        if (value == "Location 1") {
                          desti = 1;
                          finaldesti = desti1 - desti;

                          if(finaldesti==0){
                            finaldesti=1;
                          }
                        } else if (value == "Location 2") {
                          desti = 2;
                          finaldesti = desti1 - desti;
                          if(finaldesti==0){
                            finaldesti=1;
                          }
                        } else if (value == "Location 3") {
                          desti = 3;
                          finaldesti = desti1 - desti;
                          if(finaldesti==0){
                            finaldesti=1;
                          }
                        } else {
                          desti = 4;
                          finaldesti = desti1 - desti;
                          if(finaldesti==0){
                            finaldesti=1;
                          }
                        }

                        print(finaldesti.abs());
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Plan : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: Colors.blue,
                    value: plan,
                    // elevation: 15,
                    style: TextStyle(color: Colors.black),
                    items: <String>[
                      "plan 1",
                      "plan 2",
                      "plan 3",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Select Plan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        plan = value!;
                        if (value == "plan 1") {
                          planDesti = (finaldesti.abs() ) * 1.abs();
                          // planDesti = planDesti - 1;
                          sPlan = 1;
                        } else if (value == "plan 2") {
                          planDesti = (finaldesti.abs()) * 2.abs();
                          // planDesti = planDesti - 2;
                          sPlan = 2;
                        } else {
                          print("------${(finaldesti.abs())}");
                          planDesti = (finaldesti.abs() ) * 3.abs();
                          // planDesti = planDesti - 3;
                          sPlan = 3;
                        }
                        print(planDesti.abs());
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      show = true;
                      if (finaldesti == 0 || finaldesti == 1) {
                        planDesti = 1;
                        sPlan= 1;
                        end = DateTime.now();
                      } else {
                        end =
                            DateTime.now().add(Duration(days: planDesti.abs()));
                      }
                      enddate = DateFormat('dd-MMMM-yyyy').format(end);
                      doneDate = DateFormat('dd-MMMM-yyyy').format(now);
                    });
                  },
                  child: Text("CHECK BOOKING")),
              show
                  ? Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Start Date : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text("$doneDate")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("End Date : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text("$enddate")
                        ],
                      )
                    ],
                  ),
                ],
              )
                  : Container(),
              ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  // onPressed: () async {
                  //   final picked = await showDatePicker(
                  //     initialDate: selectedDate,
                  //     context: context,
                  //     lastDate: end,
                  //     firstDate: now,
                  //   );
                  //   setState(() {
                  //     selectedDate;
                  //     select = DateFormat('dd-MMMM-yyyy').format(selectedDate);
                  //   });
                  // },
                  child: Text("BOOK DATE")),
              select == null ? Container() : Text("${select}".split(' ')[0])
            ],
          ),
        ),
      ),
    );
  }
}
