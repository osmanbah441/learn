import 'package:flutter/material.dart';
import 'dart:math';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.icon,
    required this.total,
    required this.description,
    this.cardHight = 100,
  });

  final Widget icon;
  final int total;
  final String description;
  final double cardHight;

  @override
  Widget build(BuildContext context) {
    // Generate random dark colors
    Color color1 = _randomDarkColor();
    Color color2 = _randomDarkColor();

    return Container(
      height: cardHight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon,
                const SizedBox(width: 8),
                Text(
                  '$total',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _randomDarkColor() {
    Random random = Random();
    int r = random.nextInt(50);
    int g = random.nextInt(50);
    int b = random.nextInt(50);
    return Color.fromARGB(255, r, g, b);
  }
}
