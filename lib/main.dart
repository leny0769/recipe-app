import 'dart:js';

import 'package:flutter/material.dart';
import 'package:projet_test/recipe.dart';
import 'package:projet_test/recipeListScreen.dart';
import 'package:projet_test/recipeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
                //useMaterial3: true,
                ));
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RecipeScreen(recipe: settings.arguments as Recipe),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              /*var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                        position: animation.drive(tween), child: child);*/
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(opacity: animation, child: child);
            });
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: Text("Erreur"), centerTitle: true),
                  body: Center(child: Text("Page not found")),
                ));
    }
  }
}
