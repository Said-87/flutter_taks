// Name: YOUR NAME
// Roll Number: YOUR ROLL NUMBER
// Question 2: GradeCard Widget

import 'package:flutter/material.dart';

class GradeCard extends StatelessWidget {
  final String name;
  final int marks;

  const GradeCard({
    super.key,
    required this.name,
    required this.marks,
  });

  String get grade {
    if (marks < 50) return 'F';
    if (marks < 60) return 'E';
    if (marks < 70) return 'D';
    if (marks < 80) return 'C';
    if (marks < 90) return 'B';

    return 'A';
  }

  Color get gradeColor {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.blue;
      case 'C':
        return Colors.teal;
      case 'D':
        return Colors.orange;
      case 'E':
        return Colors.deepOrange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool passed = grade != 'F';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: gradeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Marks: $marks',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Grade: $grade',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            passed ? Icons.check_circle : Icons.cancel,
            color: Colors.white,
            size: 32,
          ),
        ],
      ),
    );
  }
}