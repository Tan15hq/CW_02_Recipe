import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

void main() {
  runApp(RecipeApp());
}

class Recipe {
  final String name;
  final String ingredients;
  final String instructions;
  bool isFavorite;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}

class RecipeApp extends StatefulWidget {
  @override
  State<RecipeApp> createState() => _RecipeAppState();

  static _RecipeAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_RecipeAppState>();
}

class _RecipeAppState extends State<RecipeApp> {
  final List<Recipe> _recipes = [
    Recipe(
      name: 'Pasta Alfredo',
      ingredients: 'Pasta, Cream, Butter, Garlic, Parmesan',
      instructions: '1. Boil pasta\n2. Prepare sauce\n3. Mix and serve',
    ),
    Recipe(
      name: 'Paneer Butter Masala',
      ingredients: 'Paneer, Butter, Tomato, Cream, Spices',
      instructions: '1. Cook tomato base\n2. Add paneer\n3. Garnish and serve',
    ),
    Recipe(
      name: 'Veg Biryani',
      ingredients: 'Rice, Vegetables, Spices, Yogurt, Fried Onions',
      instructions: '1. Layer rice & veggies\n2. Cook on low flame\n3. Serve hot',
    ),
  ];

  List<Recipe> get recipes => _recipes;

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
    });
  }

  List<Recipe> get favoriteRecipes =>
      _recipes.where((r) => r.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final recipe = settings.arguments as Recipe;
          return MaterialPageRoute(
            builder: (context) => DetailsScreen(recipe: recipe),
          );
        }
        return null;
      },
    );
  }
}
