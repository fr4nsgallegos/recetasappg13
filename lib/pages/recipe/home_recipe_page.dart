import 'package:flutter/material.dart';
import 'package:recetasappg13/models/receta_model.dart';
import 'package:recetasappg13/pages/sliver/sliver_page.dart';
import 'package:recetasappg13/pages/tabbar/tabbar_page.dart';
import 'package:recetasappg13/widgets/dropdown_widget.dart';
import 'package:recetasappg13/widgets/form_item_widget.dart';
import 'package:recetasappg13/widgets/receta_card_widget.dart';

class HomeRecipePage extends StatefulWidget {
  @override
  State<HomeRecipePage> createState() => _HomeRecipePageState();
}

class _HomeRecipePageState extends State<HomeRecipePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _preparationController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final List<String> _options = ["Entrada", "Plato de fondo", "Postre"];
  String? _selectedOption;
  RecetaModel receta1 = RecetaModel(
    title: "Wafles",
    preparation:
        '''Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!''',
    urlImage:
        "https://cdn.shopify.com/s/files/1/0500/5121/9607/files/wafles.jpg?v=1630701223",
    type: "Postre",
  );

  List<RecetaModel> recetasList = [
    RecetaModel(
      title: "Wafles",
      preparation:
          '''Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!''',
      urlImage:
          "https://cdn.shopify.com/s/files/1/0500/5121/9607/files/wafles.jpg?v=1630701223",
      type: "Postre",
    ),
    RecetaModel(
      title: "Ceviche",
      preparation:
          '''El ceviche es uno de esos platos que parecen súper refinados, pero que realmente es tremendamente sencillo de hacer en casa. Ha tomado mucha popularidad en los últimos años en España, pero no dejar de ser un plato del día a día en Latinoamérica, más concretamente en Perú, que es de donde proviene. 
El ceviche puede hacerse con un aderezo simple de lima, lo único necesario para cocinar ligeramente el pescado y darle su textura característica, pero en este vídeo vamos a hacer una leche de tigre, una especie de caldo frío con sabores cítricos que acompaña de maravilla al pescado. 
En cuanto a la elección del pez, puedes elegir el que quieras, pero es importante que esté fresco y que sea blanco, así que pregunta a tu pescadero y que te de el que tenga mejor. Yo usé lomos de merluza, que me parece que es una de las mejores opciones.''',
      urlImage:
          "https://images.pexels.com/photos/31495670/pexels-photo-31495670.jpeg?_gl=1*v0pvc6*_ga*ODI4MzUxMDczLjE3MjI2NDc0MzI.*_ga_8JE65Q40S6*czE3NTY1MjQ3ODgkbzY4JGcxJHQxNzU2NTI0Nzk1JGo1MyRsMCRoMA..",
      type: "Plato de fondo",
    ),
  ];

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.red)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                FormItemWidget(
                  controller: _titleController,
                  hint: "Ingresa el título",
                  iconData: Icons.title,
                ),
                FormItemWidget(
                  controller: _preparationController,
                  hint: "Ingrsa la receta",
                  iconData: Icons.list,
                  maxLines: 3,
                ),
                FormItemWidget(
                  controller: _imageController,
                  hint: "Ingresa el url de la imagen",
                  iconData: Icons.image,
                ),
                DropdownWidget(
                  options: _options,
                  funcionOnChanged: (value) {
                    _selectedOption = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isEmpty ||
                        _titleController.text.length < 5) {
                      showError(
                        context,
                        "El título debe tener al menos 5 caracteres",
                      );
                      return;
                    }
                    if (_preparationController.text.isEmpty ||
                        _preparationController.text.length < 20) {
                      showError(
                        context,
                        "El título debe tener al menos 20 caracteres",
                      );
                      return;
                    }
                    if (_imageController.text.isEmpty ||
                        _imageController.text.length < 10) {
                      showError(
                        context,
                        "El título debe tener al menos 10 caracteres",
                      );
                      return;
                    }
                    if (_selectedOption == null) {
                      showError(context, "Seleccione un tipo de plato");
                      return;
                    }
                    RecetaModel recetaAux = RecetaModel(
                      title: _titleController.text,
                      preparation: _preparationController.text,
                      urlImage: _imageController.text,
                      type: _selectedOption!,
                    );
                    recetasList.add(recetaAux);
                    _titleController.clear();
                    _imageController.clear();
                    _preparationController.clear();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff0f4c5c).withOpacity(0.8),
                  ),
                  child: Text("Registrar receta"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabbarPage()),
                    );
                  },
                  child: Text("Navegación"),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: recetasList
                          .map(
                            (receta) => RecetaCardWidget(recetaModel: receta),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
