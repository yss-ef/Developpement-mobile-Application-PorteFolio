import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // On garde cette variable pour savoir sur quel item on a cliqué
  final Function(int) onTapIndex;

  const MyDrawer({super.key, required this.onTapIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important pour que le header touche le haut de l'écran
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/pp.png"),
              backgroundColor: Colors.white,
            ),
            accountName: Text(
              "Youssef FELLAH",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text("Élève-Ingénieur en Informatique"),
          ),

          // Item 1 : Accueil
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text("Accueil"),
            onTap: () {
              onTapIndex(0); // Change la page
              Navigator.pop(context); // Ferme le menu
            },
          ),

          // Item 2 : Contact
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blueAccent),
            title: Text("Contact"),
            onTap: () {
              onTapIndex(1);
              Navigator.pop(context);
            },
          ),

          // Item 3 : Parcours
          ListTile(
            leading: Icon(Icons.info, color: Colors.blueAccent),
            title: Text("Mon Parcours"),
            onTap: () {
              onTapIndex(2);
              Navigator.pop(context);
            },
          ),

          // Item 4 : Projets
          ListTile(
            leading: Icon(Icons.hub, color: Colors.blueAccent),
            title: Text("Mes Projets"),
            onTap: () {
              onTapIndex(3);
              Navigator.pop(context);
            },
          ),

          // Séparation visuelle
          Divider(),

          // Bouton Quitter
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: Text(
              "Quitter",
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}