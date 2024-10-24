import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Pre-populate with demo data
    _nameController.text = "John Doe";
    _emailController.text = "john.doe@example.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logging out...")));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg'), // Replace with your asset
            ),
            const SizedBox(height: 16.0),
            // Editable Name
            _buildTextField(
              controller: _nameController,
              label: "Name",
              isEditable: _isEditing,
            ),
            const SizedBox(height: 16.0),
            // Editable Email
            _buildTextField(
              controller: _emailController,
              label: "Email",
              isEditable: _isEditing,
            ),
            const SizedBox(height: 32.0),
            // Buttons to edit or save
            _isEditing
                ? ElevatedButton(
                    onPressed: () {
                      // Save changes logic here
                      setState(() {
                        _isEditing = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Profile updated!")),
                      );
                    },
                    child: const Text('Save Changes'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    child: const Text('Edit Profile'),
                  ),
          ],
        ),
      ),
    );
  }

  // Build TextField helper method
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isEditable = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      enabled: isEditable,
    );
  }
}
