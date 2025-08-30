import 'package:flutter/material.dart';
import 'package:recetasappg13/pages/calculator/button_model.dart';
import 'package:recetasappg13/pages/calculator/button_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  Widget _buildRowButton(List<ButtonModel> lista) {
    return Row(
      children: lista
          .map(
            (elemento) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ButtonWidget(elemento.texto),
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
              "123",
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
