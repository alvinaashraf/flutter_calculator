import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var res = "";

  Widget btn(var txt, Color btnColor, Color txtColor) {
    return Container(
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: btnColor,
              minimumSize: Size(40, 90)),
          onPressed: () {
            setState(() {
              res = res + txt;
            });
          },
          child: Text(
            txt,
            style: TextStyle(fontSize: 35, color: txtColor),
          ),
        ),
      ),
    );
  }

  clear() {
    setState(() {
      res = '';
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(res);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      res = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculator App"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    res,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.amber,
                    ),
                    onPressed: () {
                      clear();
                    },
                    child: Text(
                      "AC",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                  ),
                ),
                btn("+/-", Colors.amber, Colors.blue),
                btn("%", Colors.amber, Colors.blue),
                btn("/", Colors.amber, Colors.blue),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("7", Colors.white, Colors.black),
                btn("9", Colors.white, Colors.black),
                btn("8", Colors.white, Colors.black),
                btn("*", Colors.amber, Colors.blue),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("4", Colors.white, Colors.black),
                btn("5", Colors.white, Colors.black),
                btn("6", Colors.white, Colors.black),
                btn("-", Colors.amber, Colors.blue),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("1", Colors.white, Colors.black),
                btn("2", Colors.white, Colors.black),
                btn("3", Colors.white, Colors.black),
                btn("+", Colors.amber, Colors.blue),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber, shape: StadiumBorder()),
                    onPressed: () {
                      output();
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(34, 20, 128, 10),
                      child: Text(
                        "=",
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
