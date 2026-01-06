import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // On reste sur animate, plus simple
import 'package:url_launcher/url_launcher.dart';
import '../models/Project.dart';
import '../services/ProjectService.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  // Variable pour stocker le résultat de la requête API
  late Future<List<Project>> projects;

  @override
  void initState() {
    super.initState();
    // On appelle le service au chargement de la page
    ProjectService service = ProjectService();
    projects = service.getProject();
  }

  // Fonction simple pour ouvrir GitHub
  Future<void> _ouvrirLien(String lien) async {
    final Uri url = Uri.parse(lien);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print("Erreur : Impossible d'ouvrir le lien $lien");
    }
  }

  // Petit switch pour changer la couleur selon le langage
  Color _couleurLangage(String langage) {
    switch (langage.toLowerCase()) {
      case 'java': return Colors.deepOrange;
      case 'dart': return Colors.blueAccent;
      case 'python': return Colors.deepPurple; // J'ai enlevé le [700] pour simplifier
      case 'javascript': return Colors.amber;
      case 'php': return Colors.purple;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Mes Projets"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      // FutureBuilder gère l'état (chargement, erreur, données)
      body: FutureBuilder<List<Project>>(
        future: projects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun projet trouvé."));
          }

          // Si on a des données, on affiche la liste
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final project = snapshot.data![index];

              // Design de la carte
              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () => _ouvrirLien(project.htmlUrl),
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ligne du haut : Titre + Etoiles
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                project.name,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(project.stars.toString()),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Description (on l'affiche seulement si elle existe)
                        if (project.description != 'Aucune description disponible')
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              project.description,
                              style: TextStyle(color: Colors.grey[700], fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                        // Bas de carte : Langage + icône lien
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              label: Text(
                                  project.language,
                                  style: const TextStyle(color: Colors.white, fontSize: 10)
                              ),
                              backgroundColor: _couleurLangage(project.language),
                            ),
                            const Icon(Icons.open_in_new, size: 16, color: Colors.grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              // Animation simple (Delay calculé avec l'index pour l'effet cascade)
                  .animate()
                  .fade(duration: 500.ms)
                  .slideY(begin: 0.2, curve: Curves.easeOut, delay: (100 * index).ms);
            },
          );
        },
      ),
    );
  }
}