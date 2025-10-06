import 'package:flutter/material.dart';
import 'main.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = RecipeApp.of(context)!.favoriteRecipes;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Favorite Recipes',style: TextStyle(color: Colors.white), ),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.6),
      ),
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay for readability
          Container(color: Colors.white.withOpacity(0.25)),

          // SafeArea prevents content under the AppBar
          SafeArea(
            child: favorites.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites yet',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                : SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Column(
                      children: favorites.map((recipe) {
                        return Hero(
                          tag: recipe.name,
                          child: Card(
                            color: Colors.white.withOpacity(0.85),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 6,
                            child: ListTile(
                              title: Text(
                                recipe.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Text(
                                recipe.ingredients,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(color: Colors.black87),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/details',
                                  arguments: recipe,
                                );
                              },
                            ),
                          ),
                        );// added hero animation here
                      }).toList(),
                      //added
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
