import 'package:flutter/material.dart';
import 'package:recetasappg13/pages/calculator/button_model.dart';
import 'package:recetasappg13/pages/calculator/button_widget.dart';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = ""; //lo que voy ingresando
  String output = ""; //resultado
  String operador = "";

  double num1 = 0.0;
  double num2 = 0.0;

  void buttonPressed(String textButton) {
    if (textButton == ".") {
      buttonDecimal();
    } else if (textButton == "AC") {
      buttonAC();
    } else if (textButton == "+" ||
        textButton == "-" ||
        textButton == "x" ||
        textButton == "/") {
      if (operador == "" && input.isNotEmpty) {
        num1 = double.parse(input);
        operador = textButton;
        input = "0";
      }
    } else if (textButton == "=") {
      num2 = double.parse(input);
      funcionIgual();
      num1 = num2 = 0.0;
      operador = "";
      input = output; //realizo esto para ver el resultado en pantalla
    } else if (textButton == "<-") {
      deleteDigito();
    } else {
      buttonNumberPressed(textButton);
    }
    output = input;
    setState(() {});
  }

  void deleteDigito() {
    output.length != 0 ? input = input.substring(0, input.length - 1) : "0";
  }

  void funcionIgual() {
    switch (operador) {
      case "+":
        output = (num1 + num2).toString();
      case "-":
        output = (num1 - num2).toString();
      case "x":
        output = (num1 * num2).toString();
      case "/":
        output = (num1 / num2).toString();
      default:
        break;
    }
  }

  void buttonNumberPressed(String number) {
    // input != "0"
    //     ? input = input + number
    //     : input = number; //lógica para el 0 delante

    input != "0"
        ? input += number
        : number == "."
        ? input += number
        : input = number;
  }

  void buttonDecimal() {
    if (!input.contains(".")) {
      // input = input + ".";
      input += ".";
    }
  }

  void buttonAC() {
    input = "0";
  }

  List<ButtonModel> fila1 = [
    ButtonModel(texto: "7"),
    ButtonModel(texto: "8"),
    ButtonModel(texto: "9"),
    ButtonModel(texto: "/", color: Color(0xff3C4A40)),
  ];
  List<ButtonModel> fila2 = [
    ButtonModel(texto: "4"),
    ButtonModel(texto: "5"),
    ButtonModel(texto: "6"),
    ButtonModel(texto: "x", color: Color(0xff3C4A40)),
  ];
  List<ButtonModel> fila3 = [
    ButtonModel(texto: "1"),
    ButtonModel(texto: "2"),
    ButtonModel(texto: "3"),
    ButtonModel(texto: "-", color: Color(0xff3C4A40)),
  ];
  List<ButtonModel> fila4 = [
    ButtonModel(texto: "0"),
    ButtonModel(texto: "."),
    ButtonModel(texto: "<-"),
    ButtonModel(texto: "+", color: Color(0xff3C4A40)),
  ];
  List<ButtonModel> fila5 = [
    ButtonModel(texto: "AC", color: Color(0xff2F4B57)),
    ButtonModel(texto: "=", color: Color(0xff245136)),
  ];

  Widget _buildRowButton(List<ButtonModel> lista) {
    return Row(
      children: lista
          .map(
            (elemento) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ButtonWidget(elemento.texto, elemento.color, () {
                  buttonPressed(elemento.texto);
                }),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1C1A),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Color(0xff2B352E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Text(
              output,
              style: TextStyle(color: Colors.white, fontSize: 65),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRowButton(fila1),
                  _buildRowButton(fila2),
                  _buildRowButton(fila3),
                  _buildRowButton(fila4),
                  _buildRowButton(fila5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
