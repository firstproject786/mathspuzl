import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class vrushabh extends StatefulWidget {
  const vrushabh({Key? key}) : super(key: key);

  @override
  State<vrushabh> createState() => _vrushabhState();
}

class _vrushabhState extends State<vrushabh> {
  int? a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child:a!=null?Text("${a??0}",style: TextStyle(fontSize: 40),):CircularProgressIndicator()
          ),
          FloatingActionButton(onPressed: () {
            setState(() {
              a=a! + 1;
              pref!.setInt('key', a!);
            });
          },child: Icon(CupertinoIcons.add),)
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared();
  }
SharedPreferences? pref;
  Future<void> shared() async {
pref= await SharedPreferences.getInstance();
CircularProgressIndicator(value:await Future.delayed(Duration(seconds: 3)),);
setState(() {
  a=pref!.getInt('key')??0;
});
  }
}

