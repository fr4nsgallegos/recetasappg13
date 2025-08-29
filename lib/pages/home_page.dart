import 'package:flutter/material.dart';
import 'package:recetasappg13/models/receta_model.dart';
import 'package:recetasappg13/pages/sliver/sliver_page.dart';
import 'package:recetasappg13/widgets/form_item_widget.dart';
import 'package:recetasappg13/widgets/receta_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _preparationController = TextEditingController();

  TextEditingController _imageController = TextEditingController();

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
  );

  List<RecetaModel> recetasList = [
    RecetaModel(
      title: "Wafles",
      preparation:
          '''Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!''',
      urlImage:
          "https://cdn.shopify.com/s/files/1/0500/5121/9607/files/wafles.jpg?v=1630701223",
    ),
    RecetaModel(
      title: "Wafles",
      preparation:
          '''Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!''',
      urlImage:
          "https://cdn.shopify.com/s/files/1/0500/5121/9607/files/wafles.jpg?v=1630701223",
    ),
  ];

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
                ElevatedButton(
                  onPressed: () {
                    RecetaModel recetaAux = RecetaModel(
                      title: _titleController.text,
                      preparation: _preparationController.text,
                      urlImage: _imageController.text,
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
                      MaterialPageRoute(builder: (context) => SliverPage()),
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
