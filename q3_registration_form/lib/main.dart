// Name: YOUR NAME
// Roll Number: YOUR ROLL NUMBER
// Question 3: Event Registration App

import 'package:flutter/material.dart';

import 'registration_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Registration',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Event Registration'),
        ),
        body: const RegistrationForm(),
      ),
    );
  }
}