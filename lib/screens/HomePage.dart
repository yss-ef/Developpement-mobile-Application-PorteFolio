import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/pp.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Youssef FELLAH", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "poppins")),
                      SizedBox(height: 5),
                      Text("Élève-Ingénieur en Informatique", style: TextStyle(fontSize: 15, color: Colors.blueAccent, fontWeight: FontWeight.w600, fontFamily: "poppins")),
                      SizedBox(height: 5),
                      Text("Casablanca, Maroc", style: TextStyle(color: Colors.grey, fontFamily: "poppins")),
                      SizedBox(height: 8),
                      Chip(
                        label: Text("Recherche Alternance - Fév 2026", style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: "poppins")),
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      )
                    ],
                  ),
                )
              ],
            ),
          ).animate().fade(duration: 600.ms).slideY(begin: -0.2, end: 0),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("À propos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  "Élève-ingénieur en 2ème année à l'Université Mundiapolis, passionné par le cycle de vie logiciel complet. Rigoureux et créatif, je recherche une alternance (3 jours/semaine) pour mettre mes compétences en architecture et développement au service de projets à forte valeur ajoutée.",
                  style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5, fontFamily: "roboto"),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ).animate().fade(delay: 200.ms, duration: 600.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: const [
                      Icon(Icons.code, color: Colors.blueAccent, size: 30),
                      SizedBox(height: 10),
                      Text("Full Stack", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "poppins")),
                      Text("Java/Spring & Angular", style: TextStyle(fontSize: 11, color: Colors.grey, fontFamily: "poppins"), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: const [
                      Icon(Icons.cloud, color: Colors.orange, size: 30),
                      SizedBox(height: 10),
                      Text("Cloud & DevOps", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "poppins")),
                      Text("AWS, Docker, CI/CD", style: TextStyle(fontSize: 11, color: Colors.grey, fontFamily: "poppins"), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ).animate().fade(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}