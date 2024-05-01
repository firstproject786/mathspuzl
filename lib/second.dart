import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math/main.dart';
import 'package:math/win.dart';

class second extends StatefulWidget {
  int level;

  second(this.level);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String a = '';
  List l = [
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50",
    "34",
    "6",
    "41",
    "16",
    "126",
    "82",
    "14",
    "7",
    "132",
    "34",
    "48",
    "42",
    "288",
    "45",
    "4",
    "111",
    "47",
    "27",
    "87",
    "22",
    "253",
    "12",
    "38",
    "178",
    "1",
    "6",
    "10",
    "2",
    "20",
    "7",
    "511",
    "143547",
    "84",
    "11",
    "27",
    "3",
    "5",
    "39",
    "31",
    "10",
    "130",
    "22",
    "3",
    "14",
    "42",
    "164045",
    "11",
    "481",
    "86",
    "84",
    "13",
    "8"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return WillPopCallback();
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('img/gameplaybackground.jpg'))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  content: const Text(
                                    'You want to skip?',
                                  ),
                                  actions: <Widget>[
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return second(widget.level);
                                              },
                                            ));
                                          });
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            String lstatus =
                                                home.levelstatus[widget.level];
                                            if (lstatus == 'clear') {
                                              home.levelstatus[widget.level] =
                                                  'clear';
                                              home.pref!.setString(
                                                  'keylevel${widget.level}',
                                                  'clear');
                                              widget.level++;
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return second(widget.level);
                                                },
                                              ));
                                            } else if (lstatus == 'skip') {
                                              home.levelstatus[widget.level] =
                                                  'skip';
                                              home.pref!.setString(
                                                  'keylevel${widget.level}',
                                                  'skip');
                                              widget.level++;
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return second(widget.level);
                                                },
                                              ));
                                            } else {
                                              Navigator.pop(context);
                                              home.levelstatus[widget.level] =
                                                  'skip';
                                              home.pref!.setString(
                                                  'keylevel${widget.level}',
                                                  'skip');

                                              setState(() {
                                                widget.level++;
                                              });

                                              home.pref!
                                                  .setInt('key', widget.level);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return second(widget.level);
                                                },
                                              ));
                                            }
                                          });
                                        },
                                        child: Text(
                                          'yes',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ))
                                  ],
                                );
                              },
                            );
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 15),
                          alignment: Alignment.topRight,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('img/skip.png'))),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          'Leval ${widget.level + 1}',
                          style: TextStyle(
                              fontFamily: 'f${3}',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontStyle: FontStyle.italic),
                        )),
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.topCenter,
                        height: 70,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('img/level_board.png'))),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: const Text('hint'),
                                content: Text('${l[widget.level]}'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Ok',
                                        style: TextStyle(fontSize: 20)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20, right: 15),
                          alignment: Alignment.topLeft,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('img/hint.png'))),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 300,
                    width: 360,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('img/p${widget.level + 1}.png'))),
                  )
                ]),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Center(child: Text('$a')),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 40,
                          width: 200,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              a = a.substring(0, a.length - 1);
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('img/delete.png'))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (a == l[widget.level]) {
                                String lstatus = home.levelstatus[widget.level];
                                if (lstatus == 'clear') {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return win(widget.level);
                                    },
                                  ));
                                } else if (lstatus == 'skip') {
                                  home.levelstatus[widget.level] = 'clear';
                                  home.pref!.setString(
                                      'keylevel${widget.level}', 'clear');
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return win(widget.level);
                                    },
                                  ));
                                } else {
                                  home.levelstatus[widget.level] = 'clear';
                                  home.pref!.setString(
                                      'keylevel${widget.level}', 'clear');
                                  setState(() {
                                    widget.level++;
                                  });
                                  home.pref!.setInt('key', widget.level);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return win(widget.level - 1);
                                    },
                                  ));
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      title: const Text('Wrong answer'),
                                      content: const Text(
                                        'please check your answer',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Ok',
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text('Submit',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic)),
                            ),
                            height: 50,
                            width: 100,
                            color: Colors.black12,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(s: '1'),
                        button(s: '2'),
                        button(s: '3'),
                        button(s: '4'),
                        button(s: '5'),
                        button(s: '6'),
                        button(s: '7'),
                        button(s: '8'),
                        button(s: '9'),
                        button(s: '0'),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget button({String s = ''}) {
    return InkWell(
      onTap: () {
        setState(() {
          a = a + s;
        });
      },
      child: Container(
        child: Center(
            child: Text(
          '$s',
          style: TextStyle(color: Colors.white),
        )),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            color: Colors.white30,
            borderRadius: BorderRadius.circular(5)),
        height: 40,
        width: 30,
      ),
    );
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
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return home();
                    },
                  ));
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
