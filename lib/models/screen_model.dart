import 'package:flutter/material.dart';
import 'package:recetasappg13/pages/calculator/calculator_page.dart';
import 'package:recetasappg13/pages/navegacion/navigator_page.dart';
import 'package:recetasappg13/pages/recipe/home_recipe_page.dart';

class ScreenModel {
  Widget page;
  String title;
  IconData icon;

  ScreenModel({required this.page, required this.title, required this.icon});
}

List<ScreenModel> pageDetails = [
  ScreenModel(
    page: HomeNavigatorPage(),
    title: "Home navigator Page",
    icon: Icons.navigation_outlined,
  ),
  ScreenModel(
    page: CalculatorPage(),
    title: "Calculadora",
    icon: Icons.calculate,
  ),
  ScreenModel(
    page: HomeRecipePage(),
    title: "Recetas",
    icon: Icons.food_bank_outlined,
  ),
];
