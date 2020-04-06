import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String output ="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  buttonpressed(String buttontext) {
    if (buttontext == "CLEAR") {
     _output = "0";
     num1 = 0.0;
     num2 = 0.0;
     operand = "";
    }
    else if (buttontext == "+" || buttontext == "-" || buttontext == "X" ||
        buttontext == "/")
    {
      num1 = double.parse((output));
      operand = buttontext;
      _output = "0";
    }
    else if (buttontext == ".") //decimal check
        {
      if (_output.contains(".")) {
        print("Already contain decimal ");
        return;
      }
      else {
        _output = _output + buttontext;
      }
    }
    else if (buttontext == "=")
    {
        num2=double.parse(output);

        if(operand=="+")
          _output=(num1+num2).toString();
        if(operand=="-")
          _output=(num1-num2).toString();
        if(operand=="X")
          _output=(num1*num2).toString();
        if(operand=="/")
          _output=(num1/num2).toString();

        num1=0.0;
        num2=0.0;
        output="";
    }
    else
      {
         _output=_output + buttontext;
      }
    print(_output);
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttontext)
  {
    return Expanded(
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(49.0),
            side: BorderSide(color: Colors.black),
        ),
        child: Text(
             buttontext,
             style: TextStyle(
             fontSize: 20.0,
             fontWeight:FontWeight.bold,
               
        ),
        ),
        padding: EdgeInsets.all(24.0),
        color: Colors.grey[700],
        textColor: Colors.black,
        onPressed: ()=>
          buttonpressed(buttontext)
        ,
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
                child: Text(output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),)
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children:[
                 Row(
                   children:[
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("/")
                ]),
                Row(
                    children:[
                      buildbutton("4"),
                      buildbutton("5"),
                      buildbutton("6"),
                      buildbutton("X")
                    ]),
                Row(
                    children:[
                      buildbutton("1"),
                      buildbutton("2"),
                      buildbutton("3"),
                      buildbutton("-")
                    ]),
                Row(
                    children:[
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("00"),
                      buildbutton("+")
                    ]),
                Row(
                    children:[

                      buildbutton("CLEAR"),
                      buildbutton("=")
                    ]),
              ]),

          ],
        ),

      )

    );
  }
}
