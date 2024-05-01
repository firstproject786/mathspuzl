import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class demo1 extends StatefulWidget {
  const demo1({Key? key}) : super(key: key);

  @override
  State<demo1> createState() => _demo1State();
}
class _demo1State extends State<demo1> {
  TextEditingController td=TextEditingController();
  TextEditingController td1=TextEditingController();

  Color c=Colors.red;


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  c,
      body: Column(children: [
        TextField(controller: td,decoration: InputDecoration(labelText: 'Defaul value',border: OutlineInputBorder()),),
        TextField(controller: td1,decoration: InputDecoration(labelText: 'get value',border: OutlineInputBorder()),),
        ElevatedButton(onPressed: () {
          setState(() {
            set();

               share();
          });

        }, child: Text('Set data')),
        ElevatedButton(onPressed: () {
          setState(() {
            get();
            share();
          });

        }, child: Text('Get data')),
      ]),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share();
    get();
    set();
  }
  SharedPreferences? prefs;
  Future<void> get() async{
      td1.text=prefs?.getString('click')??'';
  }
  Future<void> set() async{
    prefs!.setString('click', td.text);
  }
  Future<void> share() async {
    prefs= await SharedPreferences.getInstance();

    setState(() {
      if(td1.text!='')
        {

            c=Colors.yellowAccent;

        }
      else
        {

            c=Colors.red;

        }
    });
  }
}
