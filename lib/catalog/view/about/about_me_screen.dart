import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "AboutScreen";
  const AboutScreen({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile.png'), // Optional
            ),
            const SizedBox(height: 12),
            const Text(
              'Mouayad Khadem Aljamee',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Senior Mobile Developer / Mobile Leader',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text('+971501485513'),
                    onTap: () {
                      _launchUrl('tel:+971501485513');
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text('kademmedo@gmail.com'),
                    onTap: () {
                      _launchUrl('mailto:kademmedo@gmail.com');
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.link, color: Colors.indigo),
                    title: const Text('LinkedIn Profile'),
                    onTap: () {
                      _launchUrl('https://www.linkedin.com/in/mouayad-khadem-aljameeh');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}