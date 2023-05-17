import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyHomePage(title: 'CALCU'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    // print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child: SizedBox(
      height: 85,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: OutlinedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 216, 252, 255)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(96, 125, 139, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(color: Color.fromARGB(255, 195, 55, 55)),
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: const Color.fromRGBO(96, 125, 139, 1),
          child: Column(children: <Widget>[
            Container(
              height: 350,
              color: CupertinoColors.darkBackgroundGray,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            // const Expanded(
            //   flex: 1,
            //   child: Divider(
            //     thickness: 1,
            //     color: Colors.blueGrey,
            //   ),
            // ),
            Container(
              color: CupertinoColors.darkBackgroundGray,
              padding:
                  const EdgeInsets.symmetric(vertical: 26.04, horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("x"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("CLEAR"),
                      buildButton("="),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
