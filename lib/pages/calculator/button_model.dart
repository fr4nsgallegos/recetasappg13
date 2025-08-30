import 'package:flutter/material.dart';

class ButtonModel {
  String texto;
  VoidCallback funcion;
  Color? color = Color(0xff202521);

  ButtonModel({required this.texto, required this.funcion, this.color});
}

List<ButtonModel> fila1 = [
  ButtonModel(texto: "7", funcion: () {}),
  ButtonModel(texto: "8", funcion: () {}),
  ButtonModel(texto: "9", funcion: () {}),
  ButtonModel(texto: "/", funcion: () {}),
];
List<ButtonModel> fila2 = [
  ButtonModel(texto: "4", funcion: () {}),
  ButtonModel(texto: "5", funcion: () {}),
  ButtonModel(texto: "6", funcion: () {}),
  ButtonModel(texto: "x", funcion: () {}),
];
List<ButtonModel> fila3 = [
  ButtonModel(texto: "1", funcion: () {}),
  ButtonModel(texto: "2", funcion: () {}),
  ButtonModel(texto: "3", funcion: () {}),
  ButtonModel(texto: "-", funcion: () {}),
];
List<ButtonModel> fila4 = [
  ButtonModel(texto: "0", funcion: () {}),
  ButtonModel(texto: ".", funcion: () {}),
  ButtonModel(texto: "<-", funcion: () {}),
  ButtonModel(texto: "+", funcion: () {}),
];
List<ButtonModel> fila5 = [
  ButtonModel(texto: "AC", funcion: () {}),
  ButtonModel(texto: "=", funcion: () {}),
];
