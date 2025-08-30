import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NAVIGATOR DEMO",
      // Ruta inical
      initialRoute: "/",
      // Mapa de rutas nombradas
      routes: {
        "/": (_) => HomeNavigatorPage(),
        "/detail": (_) => DetailPage(detalleObligatorio: "Obligatorio"),
        "/about": (_) => AboutPage(),
      },
    );
  }
}

class HomeNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Navigator Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. ir al detail page con argumentos y esperar un resultado
            ElevatedButton(
              onPressed: () async {
                // enviamos un argumen - puede ser cualquier objeto
                final result = await Navigator.pushNamed(
                  context,
                  "/detail",
                  arguments: "Hola deslde el Home",
                );

                // Al volver de Detail, mostramos el resultado - si es que se devolvió algo
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Resultado: $result")));
                }
              },
              child: Text("pushnamed a /detail con argumentos"),
            ),
            SizedBox(height: 16),
            // 2. Reemplazar la pantalla actual por About sin permitirme volver
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/about");
              },
              child: Text("Pushreplacemente a /About"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  String detalleObligatorio;

  DetailPage({super.key, required this.detalleObligatorio});

  @override
  Widget build(BuildContext context) {
    // Recuperamos el argumeno enviado desde el Home
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "OK DESDE EL DETAIL (appbar)");
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(args ?? "Sin argumentos"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Regresar al Home, enviado un "Resultado"
                Navigator.pop(context, "OK DESDE EL DETAIL (body)");
              },
              child: Text("Pop con resultado"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Pantalla about"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver pop"),
            ),
          ],
        ),
      ),
    );
  }
}

class InlinePage extends StatelessWidget {
  const InlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
