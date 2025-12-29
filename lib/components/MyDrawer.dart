import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onTapIndex;

  const MyDrawer({super.key, required this.onTapIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/pp.png"),
              backgroundColor: Colors.white,
            ),
            accountName: const Text(
              "Youssef FELLAH",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("Élève-Ingénieur en Informatique"),
          ),

          _buildDrawerItem(Icons.home, "Accueil", 0, context),
          _buildDrawerItem(Icons.phone, "Contact", 1, context),
          _buildDrawerItem(Icons.info, "Mon Parcours", 2, context),
          _buildDrawerItem(Icons.hub, "Mes Projets", 3, context),

          const Spacer(),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: const Text("Quitter", style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        onTapIndex(index);
        Navigator.pop(context);
      },
    );
  }
}