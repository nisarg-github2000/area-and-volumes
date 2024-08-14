import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

void main() {
  runApp(const AreaAndVolumeApp());
}

class AreaAndVolumeApp extends StatefulWidget {
  const AreaAndVolumeApp({super.key});

  @override
  AreaAndVolumeAppState createState() => AreaAndVolumeAppState();
}

class AreaAndVolumeAppState extends State<AreaAndVolumeApp> {
  Locale _locale = const Locale('en');
  Map<String, String> _localizedStrings = {};
  final logger = Logger();

  Future<void> _loadLocalizedStrings(Locale locale) async {
    final String path = 'assets/translations/${locale.languageCode}.json';
    try {
      logger.i('Attempting to load JSON from path: $path');
      String jsonString = await rootBundle.loadString(path);
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      setState(() {
        _localizedStrings =
            jsonMap.map((key, value) => MapEntry(key, value.toString()));
      });
      logger.i(
          'Successfully loaded localized strings for ${locale.languageCode}');
    } catch (e) {
      logger.e('Error loading localized strings from path: $path', e);
      // Provide fallback text if there's an error loading the JSON
      setState(() {
        _localizedStrings = {
          'title': 'Error',
          'learn': 'Error',
          'practice': 'Error',
          'play': 'Error',
        };
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLocalizedStrings(_locale);
  }

  void _changeLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('es')
          : const Locale('en');
      _loadLocalizedStrings(_locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                _localizedStrings['title'] ?? 'Loading...',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _buildButton(_localizedStrings['learn'] ?? 'Learn', Colors.pink),
              const SizedBox(height: 20),
              _buildButton(
                  _localizedStrings['practice'] ?? 'Practice', Colors.green),
              const SizedBox(height: 20),
              _buildButton(_localizedStrings['play'] ?? 'Play', Colors.blue),
              const SizedBox(height: 40),
              Switch(
                value: _locale.languageCode == 'es',
                onChanged: (bool value) {
                  _changeLanguage();
                },
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
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
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
