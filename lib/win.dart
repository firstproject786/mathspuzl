import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math/second.dart';

import 'main.dart';

class win extends StatefulWidget {
  int level;

  win(this.level);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return WillPopCallback();
    },
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                child: Center(
                  child: Text('PUZZLE ${widget.level + 1} COMPLATED',
                      style: TextStyle(
                          fontFamily: 'f${4}',
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.blue)),
                ),
              ),
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage('img/trophy.png'))),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return second(widget.level + 1);
                      },
                    ));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 150,
                  child: Center(
                      child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'f${4}',
                    ),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return home();
                      },
                    ));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 150,
                  child: Center(
                      child: Text(
                    'Main menu',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'f${4}',
                    ),
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: 150,
                child: Center(
                    child: Text(
                  'BUY PRO',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'f${3}',
                  ),
                )),
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: Center(
                    child: Text(
                  'SHERE THIS PUZZLE',
                  style: TextStyle(
                    fontFamily: 'f${2}',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/shareus.png')))),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('img/background.jpg'))),
        ),
      ),
    );
  }
  Future<bool> WillPopCallback() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return home();
    },));
    return true;
  }
}
