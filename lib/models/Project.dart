class Project {
  final String name;
  final String htmlUrl;
  final String description;
  final String language;
  final int stars;

  Project({
    required this.name,
    required this.htmlUrl,
    required this.description,
    required this.language,
    required this.stars,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'] ?? 'Projet sans nom',
      htmlUrl: json['html_url'] ?? '',
      description: json['description'] ?? 'Aucune description disponible',
      language: json['language'] ?? 'Autre',
      stars: json['stargazers_count'] ?? 0,
    );
  }
}