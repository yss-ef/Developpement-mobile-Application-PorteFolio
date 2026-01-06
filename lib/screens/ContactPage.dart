import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Fonction simple pour ouvrir les liens
  // On passe directement la string complète (ex: "tel:+212...")
  Future<void> _lancerURL(String lien) async {
    final Uri url = Uri.parse(lien);

    // On essaie juste de lancer l'URL
    // Les étudiants utilisent souvent 'LaunchMode.externalApplication' pour être sûrs que ça s'ouvre
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Un simple print pour le debug au lieu de throw Exception
      print('Erreur : Impossible d\'ouvrir $lien');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        // Style simple
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Le titre en haut
              const Text(
                "Disponible pour une alternance\nFévrier 2026",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                ),
              ).animate().fade().scale(), // Animation simple d'apparition

              const SizedBox(height: 30),

              // Liste des cartes de contact
              Column(
                children: [
                  _buildCard(
                      Icons.phone,
                      "Téléphone",
                      "+212 778 874 684",
                      Colors.green,
                          () => _lancerURL("tel:+212778874684")
                  ),
                  _buildCard(
                      Icons.email,
                      "Email",
                      "fellahyoussef010@gmail.com",
                      Colors.redAccent,
                          () => _lancerURL("mailto:fellahyoussef010@gmail.com")
                  ),
                  _buildCard(
                      Icons.link,
                      "LinkedIn",
                      "linkedin.com/in/yss-ef",
                      Colors.blue,
                          () => _lancerURL("https://linkedin.com/in/yss-ef")
                  ),
                  _buildCard(
                      Icons.code,
                      "GitHub",
                      "github.com/yss-ef",
                      Colors.black,
                          () => _lancerURL("https://github.com/yss-ef")
                  ),
                  _buildCard(
                      Icons.location_on,
                      "Localisation",
                      "Casablanca, Maroc",
                      Colors.orange,
                          () {
                        // Action vide ou print pour l'instant
                        print("Localisation cliquée");
                      }
                  ),
                ]
                    .animate(interval: 100.ms) // Petit effet en cascade
                    .fade(duration: 500.ms)
                    .slideX(begin: 0.1), // Glisse légèrement depuis la droite
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour créer les cartes
  Widget _buildCard(IconData icon, String titre, String sousTitre, Color couleur, VoidCallback action) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: couleur, size: 30),
        title: Text(
            titre,
            style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        subtitle: Text(sousTitre),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: action,
      ),
    );
  }
}