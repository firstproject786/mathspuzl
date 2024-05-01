import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math/main.dart';
import 'package:math/second.dart';

class third extends StatefulWidget {
  @override
  State<third> createState() => _thirdState();
}
class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return WillPopCallback();
    },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('img/background.jpg'))),
          child: Column(children: [
            Container(
              height: 80,
              width: double.infinity,
              child: Center(
                child: Text('Select Puzzle',
                    style: TextStyle(fontFamily: 'f${3}',
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        fontSize: 30)),
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: home.levelstatus.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  int level = home.pref!.getInt("key") ?? 0;
                  if (home.levelstatus[index] == 'skip') {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return second(index);
                            },
                          ));
                        });
                      },
                      child: Container(margin: EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black87),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 40,fontFamily: 'f${3}',),
                        )),
                      ),
                    );
                  }
                  else if (home.levelstatus[index] == 'clear') {
                    return InkWell(onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return second(index);
                      },));
                    },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black87),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('img/tick.png'))),
                        child: Center(
                            child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 40,fontFamily: 'f${3}',),
                        )),
                      ),
                    );
                  }
                  else {
                    if (index == level) {
                      home.pref!.setString('keylevel${level}', 'current');
                      home.levelstatus[level] = 'current';
                      home.pref!.setInt('key', level);
                      return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return second(index);
                              },
                            ));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(fontSize: 40,fontFamily: 'f${3}',),
                              )),
                        ),
                      );
                    }
                    else {
                      return Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                            fit: BoxFit.fill, "img/lock.png", color: Colors
                            .white),
                      );
                    }
                  }
                },
              ),
            )
          ]),
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
