// lib/introduction_page.dart

import 'package:flutter/material.dart';
import 'package:area_and_volume/app_localizations.dart';

class IntroductionPage extends StatelessWidget {
  final Map<String, String> localizedStrings;
  final VoidCallback changeLanguage;

  IntroductionPage({
    super.key,
    required this.localizedStrings,
    required this.changeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  localizedStrings['title'] ?? 'Loading...',
                  style: const TextStyle(
                    fontSize: 36, // Increased font size for the title
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50), // Adjusted space for consistency
                _buildButton(context, localizedStrings['learn'] ?? 'Learn',
                    Colors.pink, '/learn'),
                const SizedBox(height: 30),
                _buildButton(
                    context,
                    localizedStrings['practice'] ?? 'Practice',
                    Colors.green,
                    '/practice'),
                const SizedBox(height: 30),
                _buildButton(context, localizedStrings['play'] ?? 'Play',
                    Colors.blue, '/play'),
              ],
            ),
          ),
          // Align the toggle switch at the bottom-right corner
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Switch(
                value: Localizations.localeOf(context).languageCode == 'es',
                onChanged: (bool value) {
                  changeLanguage();
                },
                activeColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, Color color, String route) {
    return SizedBox(
      width: 300, // Increased width for the button
      height: 70, // Increased height for the button
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24, // Increased font size for button text
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
