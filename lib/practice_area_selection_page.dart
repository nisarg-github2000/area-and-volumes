// lib/area_shape_selection_page.dart

import 'package:flutter/material.dart';

class PracticeAreaSelection extends StatelessWidget {
  const PracticeAreaSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Practice - Select Shape',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShapeButton(context, 'Triangle', Colors.purple, ''),
            const SizedBox(height: 20),
            _buildShapeButton(context, 'Circle', Colors.blue, ''),
            const SizedBox(height: 20),
            _buildShapeButton(context, 'Square', Colors.green, ''),
            const SizedBox(height: 20),
            _buildShapeButton(
                context, 'Rectangle', Colors.red, '/practiceRectange'),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeButton(
      BuildContext context, String shape, Color color, String route) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context,
              route); // Handle the button press (navigate to a specific shape page)
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          shape,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
