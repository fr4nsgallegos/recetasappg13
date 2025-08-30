import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GorouterPage extends StatelessWidget {
  const GorouterPage({super.key});

  // Configurar el GOrouter
  static final GoRouter _router = GoRouter(
    routes: [
      // Ruta raiz
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) => HomeRouterPage(),
      ),

      // Ruta con parametro id y query parameter opcional(?from=...)
      GoRoute(
        path: "/detail/:id",
        name: "detail",
        builder: (context, state) {
          // path parametro obligatorio
          final id = state.pathParameters["id"]!;

          // parametro query opcional
          final from = state.uri.queryParameters["from"];
          return DetailRouterPage(id: id, from: from);
        },
      ),

      // Ruta simple
      GoRoute(
        path: "/about",
        name: "about",
        builder: (context, state) => AboutRouterPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "GOROUTER DEMO",
      routerConfig: _router,
    );
  }
}

class HomeRouterPage extends StatelessWidget {
  const HomeRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home gorouterpage")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Navegar con push con path + query y esperar un resultado
            ElevatedButton(
              onPressed: () async {
                final result = await context.push("/detail/123?from=home");
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("resultado: $result")));
                }
              },
              child: Text("Push a /detail/123? from=home"),
            ),

            SizedBox(height: 16),

            // 2. Navegar go reemplazar - No apila
            ElevatedButton(
              onPressed: () async {
                context.go("/about"); //reemplaza la ruta actual
              },
              child: Text("go a /About (reemplaza)"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRouterPage extends StatelessWidget {
  String id;
  String? from;
  DetailRouterPage({required this.id, this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("id : $id"),
            Text("from: ${from ?? "-"}"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pop("OK desde detailpage");
              },
              child: Text("POP CON REULSTADO"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutRouterPage extends StatelessWidget {
  const AboutRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Pantalla about"),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("volver pop"),
            ),
          ],
        ),
      ),
    );
  }
}
