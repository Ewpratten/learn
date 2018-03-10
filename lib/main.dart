import 'package:flutter/material.dart';


//const textStyle = const TextStyle(
//  fontFamily: 'Raleway',
//);

class TrackerWidget extends StatefulWidget {
  @override
  _TrackerWidgetState createState() => new _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  //vars
  int winc = 0;
  int looc = 0;
  int safc = 0;
  //states
  // 0 = none
  // 1 = win
  // 2 = loose
  int state = 0;
  int level = 1;
  int tryper = 3;
  int tri;


  void win() {
    setState(() {
      ;
      if (state != 1) {
        state = 1;
        looc = 0;
        winc = 1;
        safc = 0;
      }
      else if (state == 1) {
        ++winc;
        if (winc == tryper) {
          ++level;
          winc = 0;
        }
      }
    });
  }

  void loose() {
    tri = tryper + safc;
    setState(() {
      if (state != 2) {
        state = 2;
        looc = 1;
        winc = 0;
      }
      else if (state == 2) {
        ++looc;
        if (looc == tri) {
          --level;

          looc = 0;
        }
        if(level <= 0){
          level = 1;
        }
      }
    });
  }

  void safe() {
    setState(() {
      ++safc;
    });
  }

  void resetdata() {
    setState(() {
    winc = 0;
    looc = 0;
    safc = 0;
    state = 0;
    level = 1;
    });
  }

  @override
  Widget build(BuildContext context) {

  return new Column(
    children: [
      new Row(
        children: [
          new SizedBox(
            width: 390.0,
            child: new Container(
              child: new Text('Level: $level',style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 4.0),textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
      new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new RaisedButton(
            child: new Text('Success'),
            color: Colors.blue[500],
            onPressed: win,
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new RaisedButton(
            child: new Text('Fail'),
            color: Colors.red[600],
            onPressed: loose,
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new RaisedButton(
            child: new Text('Close'),
            color: Colors.yellow[500],
            onPressed: safe,
          ),
        ),
      ],
    ),
      new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new RaisedButton(
              child: new Text('Reset'),
              color: Colors.grey[500],
              onPressed: resetdata,
            ),
          ),
        ],
      ),
    ],
    );
  }
}

void main() { runApp(new MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'New Skill Assistant',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('New Skill Assistant'),
        ),
        body:
          new TrackerWidget(),
      ),
    );
  }
}