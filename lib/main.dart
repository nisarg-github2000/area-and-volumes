// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:area_and_volume/app_localizations.dart';
import 'package:area_and_volume/learn_page.dart';
import 'package:area_and_volume/practice_page.dart'; // Import PracticePage
import 'package:area_and_volume/learn/area_page.dart'; // Import AreaPage
import 'package:area_and_volume/learn/volume_page.dart'; // Import VolumePage
import './introduction_page.dart';

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
      logger.e('Error loading localized strings from path: $path');
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
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      routes: {
        '/': (context) => IntroductionPage(
              localizedStrings: _localizedStrings,
              changeLanguage: _changeLanguage,
            ),
        '/learn': (context) => const LearnPage(),
        '/practice': (context) => const PracticePage(),
        '/area': (context) => const AreaPage(), // Route for AreaPage
        '/volume': (context) => const VolumePage(), // Route for VolumePage
      },
      initialRoute: '/',
    );
  }
}
