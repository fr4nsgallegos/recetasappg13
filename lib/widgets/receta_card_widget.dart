import 'package:flutter/material.dart';
import 'package:recetasappg13/models/receta_model.dart';

class RecetaCardWidget extends StatelessWidget {
  RecetaModel recetaModel;

  RecetaCardWidget({required this.recetaModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff0f4c5c).withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              recetaModel.urlImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            recetaModel.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            recetaModel.preparation,
            maxLines: 3,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
