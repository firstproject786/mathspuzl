import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math/second.dart';
import 'package:math/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
    ScreenUtil.init(context, designSize: const Size(360, 690));
    double screenwidth = MediaQuery.of(context).size.width.w;
    double screenhight = MediaQuery.of(context).size.height.h;
    double actualwidthdp = ScreenUtil().setWidth(360);
    double actualhightdp = ScreenUtil().setHeight(690);
    double? pixeldestiny = ScreenUtil().pixelRatio;

    return WillPopScope(
      onWillPop: () {
        return WillPopCallback();
      },
      child: Scaffold(
          body: Container(
        width: screenwidth,
        height: screenhight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('img/background.jpg'))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(30.h),
            child: Center(
                child: Text(
              'Math Puzzle',
              style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontFamily: 'f${2}',
              ),
            )),
          ),
          Container(
            margin: EdgeInsets.all(20.h),
             height: 450.h,
            decoration: const BoxDecoration(
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
                  margin: EdgeInsets.all(5.h),
                  width: screenwidth,
                  child: Center(
                      child: Text('Continue',
                          style: TextStyle(fontFamily: 'f${1}',
                               fontStyle: FontStyle.italic,
                              fontSize: 60.sp,
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
                  margin: EdgeInsets.all(5.h),
                  width: screenwidth,
                  child: Center(
                      child: Text('Puzzle ',
                          style: TextStyle(fontFamily: 'f${1}',
                              fontStyle: FontStyle.italic,
                              fontSize: 60.sp,
                              color: Colors.white))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.h),
                width: screenwidth,
                child: Center(
                    child: Text('Buy Pro',
                        style: TextStyle(fontFamily: 'f${1}',
                            fontStyle: FontStyle.italic,
                            fontSize: 50.sp,
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
                  style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                )),
            InkWell(
                onTap: () {
                  exit(0);
                },
                child: Text(
                  'yes',
                  style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                ))
          ],
        );
      },
    );
    return true;
  }
}
