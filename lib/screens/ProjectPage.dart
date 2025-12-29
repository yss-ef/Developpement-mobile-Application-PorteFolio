import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/Project.dart';
import '../services/ProjectService.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Future<List<Project>> projects;

  @override
  void initState() {
    super.initState();
    ProjectService projectService = ProjectService();
    projects = projectService.getProject();
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Impossible de lancer $urlString');
    }
  }

  Color _getLanguageColor(String language) {
    switch (language.toLowerCase()) {
      case 'java': return Colors.orange;
      case 'dart': return Colors.blue;
      case 'python': return Colors.yellow[700]!;
      case 'typescript': return Colors.blueAccent;
      case 'php': return Colors.purple;
      case 'javascript': return Colors.amber;
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
        backgroundColor:  const Color(0xFFF5F5F5),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Project>>(
        future: projects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final project = snapshot.data![index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () => _launchURL(project.htmlUrl),
                            borderRadius: BorderRadius.circular(15),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          project.name,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "poppins"),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Chip(
                                        label: Text(project.language, style: const TextStyle(color: Colors.white, fontSize: 10)),
                                        backgroundColor: _getLanguageColor(project.language),
                                        padding: EdgeInsets.zero,
                                        visualDensity: VisualDensity.compact,
                                      ),
                                      const Icon(Icons.open_in_new, size: 16, color: Colors.grey),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text("Aucun projet trouvé."));
          }
        },
      ),
    );
  }
}