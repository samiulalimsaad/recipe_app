import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final Map<String, List<Map<String, String>>> recipes = {
    'Appetizers': [
      {
        'name': 'Bruschetta',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ5AdJW9kepKcRhxPYktA-S7vop0-NBgWuJA&s'
      },
      {
        'name': 'Stuffed Mushrooms',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuV82u1VASCQbNSzfR9KZvDXS5GDsdlN2VgA&s'
      },
      {
        'name': 'Caprese Salad',
        'image':
            'https://whatsgabycooking.com/wp-content/uploads/2023/06/Dinner-Party-__-Traditional-Caprese-1-1200x800-1.jpg'
      },
      {
        'name': 'Spring Rolls',
        'image':
            'https://www.elmundoeats.com/wp-content/uploads/2024/02/Crispy-spring-rolls.jpg'
      },
      {
        'name': 'Deviled Eggs',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxqmB_SfcaKq0h6LM68a5EMua1eZikvvofgA&s'
      },
    ],
    'Main Courses': [
      {
        'name': 'Spaghetti Carbonara',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVVWjTcAEsVbCfXYj4v8VbBEwMEf4y4FJEtg&s'
      },
      {
        'name': 'Grilled Chicken',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_70EYZOC0uaAZ4iKgu8T6tnGlOYTgAjf-_w&s'
      },
      {
        'name': 'Beef Stroganoff',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsic38j4JwaESviaaVuYoksLfIJo_K6viwGg&s'
      },
      {
        'name': 'Vegetable Stir Fry',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlIDmvispu-Jb2sDu_T8380S5zUXl9DL0pnw&s'
      },
      {
        'name': 'Fish Tacos',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHg1mdvFz8NzKX3Ne5FzJ1luLZ8K8uAO3UyA&s'
      },
    ],
    'Desserts': [
      {
        'name': 'Cheesecake',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWOlpOyTxOyRTWtrGKVTqxBd1GOY8OmaZ3nQ&s'
      },
      {
        'name': 'Chocolate Cake',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ_ywTvuu-4nMrLriSQytn6z74mN6XUIV54Q&s'
      },
      {
        'name': 'Apple Pie',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-azG1pRFWIurI2k4fpy8jYK9u0TdPteE0Og&s'
      },
      {
        'name': 'Panna Cotta',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3yiz865sf_PMfXbcmme1xRlCuiO52NV5KSw&s'
      },
      {
        'name': 'Brownies',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9PBlsuSKXUy5VjJ_FBDVWREXd4beNSqD1CA&s'
      },
    ],
    'Drinks': [
      {
        'name': 'Mojito',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSTElrL7iakSntCJuXaI2wPVXyyO5a7lObrA&s'
      },
      {
        'name': 'Lemonade',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDMCSEHTVr1_-nEjJcobgVnpeOFmiCPTarlg&s'
      },
      {
        'name': 'Margarita',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5mVw3E2NPJrEcX_eE0WIlqYlN35RUNeYkxA&s'
      },
      {
        'name': 'Iced Tea',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsayq3fjOUcV5H30n-BD6yk0iFPjebwmKSQw&s'
      },
      {
        'name': 'Pina Colada',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsTDBFpPl4deBXOn33JmdQpJ1bH8p-G8f9g&s'
      },
    ],
  };

  String _selectedCategory = 'All';
  List<Map<String, String>> _filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    _filteredRecipes = _getAllRecipes();
  }

  List<Map<String, String>> _getAllRecipes() {
    List<Map<String, String>> allRecipes = [];
    recipes.forEach((category, categoryRecipes) {
      allRecipes.addAll(categoryRecipes);
    });
    return allRecipes;
  }

  void _filterRecipes(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredRecipes = _getAllRecipes();
      } else {
        _filteredRecipes = recipes[category]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedCategory,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _filterRecipes(newValue);
                }
              },
              items: ['All', 'Appetizers', 'Main Courses', 'Desserts', 'Drinks']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3 / 4,
              ),
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _filteredRecipes[index];
                return RecipeCard(
                  name: recipe['name']!,
                  imagePath: recipe['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
