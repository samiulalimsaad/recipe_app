import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String name;
  final String imagePath;

  const RecipeCard({super.key, required this.name, required this.imagePath});

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool _isHovered = false; // To track hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovered = true), // Set hover state to true
      onExit: (_) =>
          setState(() => _isHovered = false), // Set hover state to false
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 200, // Set a fixed height for the card
          child: Stack(
            children: [
              // Image that expands to the full height of the card
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  height: double.infinity, // Fill the height of the card
                  width: double.infinity, // Fill the width of the card
                ),
              ),
              // Gradient overlay for improved text visibility
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.black.withOpacity(0.0), // Transparent gradient
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Show recipe name when hovered
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: AnimatedOpacity(
                  opacity: _isHovered
                      ? 1.0
                      : 0.0, // Change opacity based on hover state
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
