// Name: YOUR NAME
// Roll Number: YOUR ROLL NUMBER
// Question 2: Grade Dashboard

import 'package:flutter/material.dart';

import 'grade_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Dashboard',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
      ),
      home: const GradeDashboard(),
    );
  }
}

class GradeDashboard extends StatelessWidget {
  const GradeDashboard({super.key});

  // The parent widget stores the student data.
  final List<Map<String, Object>> students = const [
    {'name': 'Ali Khan', 'marks': 95},
    {'name': 'Sara Ahmed', 'marks': 85},
    {'name': 'Hamza Shah', 'marks': 75},
    {'name': 'Ayesha Noor', 'marks': 65},
    {'name': 'Bilal Raza', 'marks': 55},
    {'name': 'Zain Malik', 'marks': 45},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
        children: students.map((student) {
          return GradeCard(
            name: student['name'] as String,
            marks: student['marks'] as int,
          );
        }).toList(),
      ),
    );
  }
}