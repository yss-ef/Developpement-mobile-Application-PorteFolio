import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchAction(String schema, String path) async {
    final Uri uri = Uri(scheme: schema, path: path);
    if (schema == 'https') {
      final Uri url = Uri.parse(path);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Impossible de lancer $path');
      }
    } else {
      if (!await launchUrl(uri)) {
        throw Exception('Impossible de lancer $uri');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
        backgroundColor:  const Color(0xFFF5F5F5),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Disponible pour une alternance\nFévrier 2026",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent, fontFamily: "poppins"),
            )
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(duration: 2000.ms, color: Colors.blueAccent.withOpacity(0.3))
                .animate()
                .fade(duration: 600.ms)
                .scale(delay: 200.ms),

            const SizedBox(height: 25),

            Column(
              children: [
                _buildCard(Icons.phone, "Téléphone", "+212 778 874 684", Colors.green, () => _launchAction('tel', '+212778874684')),
                _buildCard(Icons.email, "Email", "fellahyoussef010@gmail.com", Colors.redAccent, () => _launchAction('mailto', 'fellahyoussef010@gmail.com')),
                _buildCard(Icons.link, "LinkedIn", "linkedin.com/in/yss-ef", Colors.blue[800]!, () => _launchAction('https', 'https://linkedin.com/in/yss-ef')),
                _buildCard(Icons.code, "GitHub", "github.com/yss-ef", Colors.black87, () => _launchAction('https', 'https://github.com/yss-ef')),
                _buildCard(Icons.location_on, "Localisation", "Casablanca, Maroc", Colors.orange, () {}),
              ]
                  .animate(interval: 100.ms)
                  .fade(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOutQuad),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "poppins")),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.black87, fontFamily: "roboto")),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}