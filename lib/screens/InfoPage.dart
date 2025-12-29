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
        backgroundColor:  const Color(0xFFF5F5F5),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const _SectionTitle(title: "Formation")
              .animate().fade().slideX(begin: -0.2),

          Column(
            children: [
              _buildEducationItem("2025 - Présent", "Cycle d'Ingénieur", "Université Mundiapolis", true),
              _buildEducationItem("2024 - 2025", "Licence (LST) Génie Logiciel", "FST Errachidia", false),
              _buildEducationItem("2022 - 2024", "DEUST MIP", "FST Errachidia", false),
            ].animate(interval: 100.ms).fade().slideY(begin: 0.2),
          ),

          const SizedBox(height: 25),

          const _SectionTitle(title: "Certifications")
              .animate().fade(delay: 300.ms).slideX(begin: -0.2),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.orange.withOpacity(0.5)),
            ),
            child: Row(
              children: const [
                Icon(Icons.workspace_premium, color: Colors.orange, size: 30),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("AWS Academy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "poppins")),
                      Text("Graduate Cloud Foundations", style: TextStyle(color: Colors.grey, fontFamily: "roboto")),
                    ],
                  ),
                )
              ],
            ),
          ).animate(delay: 400.ms).fade().scale(),

          const SizedBox(height: 25),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _SectionTitle(title: "Langues"),
                    _SkillChip("Français (Courant)"),
                    _SkillChip("Anglais (Technique)"),
                    _SkillChip("Arabe (Natif)"),
                  ],
                ).animate(delay: 500.ms).fade().slideX(begin: -0.3),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _SectionTitle(title: "Soft Skills"),
                    _SkillChip("Travail d'équipe"),
                    _SkillChip("Résolution Problèmes"),
                    _SkillChip("Autonomie"),
                  ],
                ).animate(delay: 500.ms).fade().slideX(begin: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String year, String title, String school, bool isCurrent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isCurrent ? Border.all(color: Colors.blueAccent) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isCurrent ? Colors.blueAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(year, style: TextStyle(fontSize: 12, color: isCurrent ? Colors.white : Colors.black87, fontWeight: FontWeight.bold, fontFamily: "poppins")),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(school, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "poppins")),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "roboto")),
    );
  }
}