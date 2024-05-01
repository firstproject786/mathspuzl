import 'dart:io';
import 'package:flutter/material.dart';
import 'package:math/second.dart';
import 'package:math/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: home(),
  ));
}

int? level;

class home extends StatefulWidget {
  static SharedPreferences? pref;
  static List<String> levelstatus = [];
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return WillPopCallback();
      },
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('img/background.jpg'))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Center(
                child: Text(
              'Math Puzzle',
              style: TextStyle(
                  fontSize: 50,fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'f${2}',
                  ),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('img/blackboard_main_menu.png'))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  setState(() {
                    shared();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return second(level!);
                      },
                    ));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Center(
                      child: Text('Continue',
                          style: TextStyle(fontFamily: 'f${1}',
                               fontStyle: FontStyle.italic,
                              fontSize: 60,
                              color: Colors.white))),
                ),
              ),
              InkWell(
                onTap: () {
                  shared();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return third();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Center(
                      child: Text('Puzzle ',
                          style: TextStyle(fontFamily: 'f${1}',
                              fontStyle: FontStyle.italic,
                              fontSize: 60,
                              color: Colors.white))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Center(
                    child: Text('Buy Pro',
                        style: TextStyle(fontFamily: 'f${1}',
                            fontStyle: FontStyle.italic,
                            fontSize: 50,
                            color: Colors.white))),
              ),
            ]),
          )
        ]),
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared();
  }

  Future<void> shared() async {
    home.pref = await SharedPreferences.getInstance();
    setState(() {
      level = home.pref!.getInt('key') ?? 0;
        home.levelstatus.clear();
      for (int i = 0; i <= 75; i++) {
        String status = home.pref!.getString('keylevel$i') ?? 'pending';

        home.levelstatus.add(status);
      }
      print('${home.levelstatus}');
    });
  }

  Future<bool> WillPopCallback() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: const Text(
            'You want to exit?',
          ),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                )),
            InkWell(
                onTap: () {
                  exit(0);
                },
                child: Text(
                  'yes',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ))
          ],
        );
      },
    );
    return true;
  }
}
