import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_exam/models/Project.dart';

class ProjectService{
  String username = "yss-ef";

  Future <List<Project>> getProject() async {
    final Uri _uri = Uri.parse("https://api.github.com/users/$username/repos");
    final response = await http.get(_uri);
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => Project.fromJson(e)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des projets");
    }
  }
}