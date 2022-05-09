import 'package:flutter/material.dart';

class BlackCalculator extends StatefulWidget {
  const BlackCalculator({Key? key}) : super(key: key);

  @override
  State<BlackCalculator> createState() => _calculatorState();

}

class _calculatorState extends State<BlackCalculator> {

  String num1 = "";
  String num2 = "";
  String operator = "";
  String result = "";
  String equals = "";
  bool isonnum1 = true;

  void operation(String title) {
    if (title == "clear") {
      num1 = "";
      num2 = "";
      operator = "";
      result = "";
      isonnum1 = true;
      equals = "";
    }
    else if (title == "=") {
      equals = "=";
      if (num1.isEmpty) {
        num1 = "0";
      }
      if (num2.isEmpty) {
        num2 = "0";
      }
      if (operator.isEmpty) {
        operator = "+";
      }
      int number1 = int.parse(num1);
      int number2 = int.parse(num2);
      int answer = 0;
      if (operator == "+") {
        answer = number1 + number2;
      } else if (operator == "-") {
        answer = number1 - number2;
      } else if (operator == "/") {
      
        answer = (number1 / number2) as int;
      } else if (operator == "*") {
        answer = number1 * number2;
      }
      result = answer.toString();
    } else if (title == "+" || title == "-" || title == "*" || title == "/") {
      operator = title;
      isonnum1 = false;
    } else {
      if (isonnum1) {
        if(num1.length < 9) {
          num1 += title;
        }
      }

      else {
        if (num2.length < 9) {
          num2 += title;
        }
      }
    }
    setState(() {});
  }

  Widget button(String title) {
    return GestureDetector(
      onTap: () {
        print(title);
        operation(title);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4 - 10,
        height: MediaQuery.of(context).size.height / 8 - 10,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buttonrow(List<String> titles) {
    return Row(
      children: [
        button(titles[0]),
        button(titles[1]),
        button(titles[2]),
        button(titles[3]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
         backgroundColor: Colors.black,
        title: Center(
          child: Text('Calculator', style: TextStyle(shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              blurRadius: 15
            ),
          ]),),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 80,
              child: Center(
                child: Wrap(children: [
                  Text(
                    num1,
                    style: const TextStyle(fontSize: 55.0),
                  ),
                  Text(
                    operator,
                    style: const TextStyle(fontSize: 55.0),
                  ),
                  Text(
                    num2,
                    style: const TextStyle(fontSize: 55.0),
                  ),
                  Text(
                    equals,
                    style: const TextStyle(fontSize: 55.0),
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 55.0),
                  )
                ]),
              )),
          Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(21.0),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(children: [
                buttonrow(["7", "8", "9", "/"]),
                buttonrow(["4", "5", "6", "*"]),
                buttonrow(["1", "2", "3", "-"]),
                buttonrow(["clear", "0", "=", "+"]),
              ]))
        ],
      ),
    );
  }
}