import 'package:flutter/material.dart';
import 'package:area_and_volume/app_localizations.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
            AppLocalizations.of(context)!.translate('learn_select_topic') ??
                'Learn - Select Topic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'area', Colors.purple),
            const SizedBox(height: 20),
            _buildButton(context, 'volume', Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
  }

  Widget _buildButton(BuildContext context, String textKey, Color color) {
    return SizedBox(
      width: 200,
      height: 50,
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
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
