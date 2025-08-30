import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => HomeNavigatorPage(),
        //ruta raiz
      },
      onGenerateRoute: (settings) {
        // Centralizar las rutas con argumentos
        if (settings.name == "/product") {
          final args =
              settings.arguments as Map<String, dynamic>?; //puede ser null
          final id = (args?["id"]) as int? ?? 0;
          return MaterialPageRoute(
            builder: (context) => ProductNavigatorPage(id: id),
            settings: settings,
            fullscreenDialog: false,
          );
        }
        ;
        // 404 genérico
        return MaterialPageRoute(builder: (context) => NotFoundNavigatorPage());
      },
    );
  }
}

class HomeNavigatorPage extends StatelessWidget {
  Future<void> _openProduct(BuildContext context) async {
    // pushnamed con argumentos
    final result = await Navigator.of(
      context,
    ).pushNamed("/product", arguments: {"id": 99});

    if (!context.mounted) return;
    if (result != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Resultado $result")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _openProduct(context),
              child: Text("Ir al producto 99 y espperar el resultado"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductNavigatorPage extends StatelessWidget {
  final int id;
  const ProductNavigatorPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Producto $id")),
      body: Center(
        child: Column(
          children: [
            Text("Mostrando el detalle del producto $id"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop("OK-$id");
              },
              child: Text("Volver con resultado"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoogedInNavigatorPage extends StatelessWidget {
  const LoogedInNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Sesión iniciada")));
  }
}

class NotFoundNavigatorPage extends StatelessWidget {
  const NotFoundNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("No encontrado")));
  }
}
