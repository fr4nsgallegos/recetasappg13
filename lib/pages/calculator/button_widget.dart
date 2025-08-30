import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String texto;
  Color color;
  VoidCallback funcion;

  ButtonWidget(this.texto, this.color, this.funcion, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide.none,
      ),
      onPressed: funcion,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 10,
        // width: MediaQuery.of(context).size.width / 8,
        child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
