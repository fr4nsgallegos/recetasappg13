import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String texto;

  ButtonWidget(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xff202521),
          side: BorderSide.none,
        ),
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          // width: MediaQuery.of(context).size.width / 8,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
