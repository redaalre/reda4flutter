// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: reda(),
    );
  }
}

// ignore: camel_case_types
class reda extends StatefulWidget {
  const reda({super.key});

  @override
  State<reda> createState() => _redaState();
}

// ignore: camel_case_types
class _redaState extends State<reda> {
  TextEditingController con = TextEditingController();
  String operation = '';
  String result = '';
  void _calculate() {
    int number = int.tryParse(con.text) ?? 0;
    setState(() {
      if (operation == 'fact') {
        result = (number * 2).toString();
      } else if (operation == 'multiples') {
        result = List.generate(10, (index) => (number * (index + 1)).toString())
            .join('\n');
      } else if (operation == 'convert') {
        result = (-number).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextFiled("enter number1", "number1", con),
          SizedBox(
            height: 18,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'fact';
                        _calculate();
                      });
                    },
                    child: Text("المضروب")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'multiples';
                        _calculate();
                      });
                    },
                    child: Text("المضاعف")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'convert';
                        _calculate();
                      });
                    },
                    child: Text("التحويل")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        con.clear();
                      });
                    },
                    child: Text("clean")),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: 100,
              color: Color.fromARGB(255, 188, 205, 219),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 110, 96, 96)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding TextFiled(hint, lble, con) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: con,
        decoration: InputDecoration(
            hintText: hint,
            labelText: lble,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)))),
      ),
    );
  }
}

