// Name: YOUR NAME
// Roll Number: YOUR ROLL NUMBER
// Question 3: RegistrationForm Widget

import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() {
    return _RegistrationFormState();
  }
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  bool isRegistered = false;

  String registeredName = '';
  String registeredEmail = '';

  void showMessage(String message) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void register() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    // Validate in the order required by the assignment.
    if (name.isEmpty) {
      showMessage('Name is required');
      return;
    }

    if (email.isEmpty) {
      showMessage('Email is required');
      return;
    }

    if (!email.contains('@')) {
      showMessage('Enter a valid email');
      return;
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    setState(() {
      registeredName = name;
      registeredEmail = email;
      isRegistered = true;
    });
  }

  void reset() {
    nameController.clear();
    emailController.clear();

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    setState(() {
      isRegistered = false;
      registeredName = '';
      registeredEmail = '';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Campus Event Registration',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: nameController,
            readOnly: isRegistered,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: 'Full name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            readOnly: isRegistered,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isRegistered ? null : register,
            child: const Text('Register'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: reset,
            child: const Text('Reset'),
          ),
          const SizedBox(height: 24),
          if (isRegistered)
            Text(
              'Registered: $registeredName ($registeredEmail)',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
        ],
      ),
    );
  }
}