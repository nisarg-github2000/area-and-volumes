// lib/practice_page.dart

import 'package:flutter/material.dart';
import 'package:area_and_volume/app_localizations.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.home, size: 30), // Increased icon size
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.translate('practice_select_topic') ??
              'Practice - Select Topic', // Updated title text
          style: const TextStyle(
            fontSize: 30, // Increased font size for the AppBar title
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, 'Area', Colors.orange),
                const SizedBox(height: 30),
                _buildButton(context, 'Volume', Colors.teal),
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
                  String newLocale = value ? 'es' : 'en';
                  Navigator.of(context).pushReplacementNamed('/');
                  // Implement changing the locale here
                },
                activeColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String textKey, Color color) {
    return SizedBox(
      width: 300, // Increased width for the button
      height: 70, // Increased height for the button
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.translate(textKey) ?? textKey,
          style: const TextStyle(
            fontSize: 24, // Increased font size for button text
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
