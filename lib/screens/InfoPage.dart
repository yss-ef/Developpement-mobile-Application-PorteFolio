import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Mon Parcours"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        // Style simple, sans police personnalisée
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // --- FORMATION ---
          _buildTitreSection("Formation")
              .animate().fade().slideX(begin: -0.2),

          Column(
            children: [
              _buildEcole("2025 - Présent", "Cycle d'Ingénieur", "Université Mundiapolis", true),
              _buildEcole("2024 - 2025", "Licence (LST) Génie Logiciel", "FST Errachidia", false),
              _buildEcole("2022 - 2024", "DEUST MIP", "FST Errachidia", false),
            ].animate(interval: 100.ms).fade().slideY(begin: 0.2),
          ),

          const SizedBox(height: 25),

          // --- CERTIFICATIONS ---
          _buildTitreSection("Certifications")
              .animate().fade(delay: 300.ms).slideX(begin: -0.2),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // Bordure orange simple
              border: Border.all(color: Colors.orange),
            ),
            child: Row(
              children: [
                const Icon(Icons.workspace_premium, color: Colors.orange, size: 30),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "AWS Academy",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                      ),
                      Text(
                          "Graduate Cloud Foundations",
                          style: TextStyle(color: Colors.grey)
                      ),
                    ],
                  ),
                )
              ],
            ),
          ).animate(delay: 400.ms).fade().scale(),

          const SizedBox(height: 25),

          // --- LANGUES ET SOFT SKILLS (2 COLONNES) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colonne Gauche : Langues
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitreSection("Langues"),
                    _buildChip("Français (Courant)"),
                    _buildChip("Anglais (Technique)"),
                    _buildChip("Arabe (Natif)"),
                  ],
                ).animate(delay: 500.ms).fade().slideX(begin: -0.3),
              ),

              const SizedBox(width: 15),

              // Colonne Droite : Soft Skills
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitreSection("Soft Skills"),
                    _buildChip("Travail d'équipe"),
                    _buildChip("Résolution Problèmes"),
                    _buildChip("Autonomie"),
                  ],
                ).animate(delay: 500.ms).fade().slideX(begin: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- MÉTHODES D'AIDE (HELPERS) ---
  // Les étudiants préfèrent souvent faire des méthodes ici plutôt que des classes séparées

  Widget _buildTitreSection(String titre) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
          titre,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ),
    );
  }

  Widget _buildEcole(String annee, String titre, String ecole, bool estActuel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // Si c'est l'actuel, on met une bordure bleue
        border: estActuel ? Border.all(color: Colors.blueAccent) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge Année
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: estActuel ? Colors.blueAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
                annee,
                style: TextStyle(
                    fontSize: 12,
                    color: estActuel ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          const SizedBox(height: 8),
          Text(titre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(ecole, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)
      ),
    );
  }
}