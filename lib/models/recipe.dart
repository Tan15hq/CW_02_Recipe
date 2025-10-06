class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;
  final String image;
  bool isFavorite;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.image,
    this.isFavorite = false,
  });
}
