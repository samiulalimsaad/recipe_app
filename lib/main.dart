import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const RecipeListPage(),
    const SearchPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final Map<String, List<Map<String, String>>> recipes = {
    'Appetizers': [
      {'name': 'Bruschetta', 'image': 'assets/bruschetta.jpg'},
      {'name': 'Stuffed Mushrooms', 'image': 'assets/mushrooms.jpg'},
    ],
    'Main Courses': [
      {'name': 'Spaghetti Carbonara', 'image': 'assets/spaghetti.jpg'},
      {'name': 'Grilled Chicken', 'image': 'assets/chicken.jpg'},
    ],
    'Desserts': [
      {'name': 'Cheesecake', 'image': 'assets/cheesecake.jpg'},
      {'name': 'Chocolate Cake', 'image': 'assets/chocolate_cake.jpg'},
    ],
    'Drinks': [
      {'name': 'Mojito', 'image': 'assets/mojito.jpg'},
      {'name': 'Lemonade', 'image': 'assets/lemonade.jpg'},
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

class RecipeCard extends StatelessWidget {
  final String name;
  final String imagePath;

  RecipeCard({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
      ),
      body: const Center(
        child: Text('Search for your favorite recipes here!'),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: const Center(
        child: Text('Your favorite recipes will be listed here!'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
      ),
      body: const Center(
        child: Text('Manage your profile here!'),
      ),
    );
  }
}
