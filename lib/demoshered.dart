import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
 // int SharedPreferences prefs =SharedPreferences;
    SharedPreferences? prefs;
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(onTap:() {
       setState(() {
         a++;
       });
      },
        child: Container(
          child: Icon(CupertinoIcons.add,size: 40),
        ),
      ),
      body: Center(
        child: Container(
            child: Text(
          '$a',
          style: TextStyle(
            fontSize: 40,
          ),
        )),
      ),

    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared();
  }
  Future<void> shared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
}
