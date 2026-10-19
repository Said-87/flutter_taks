// Name: YOUR NAME
// Roll Number: YOUR ROLL NUMBER
// Question 1: Campus Records Management

import 'dart:io';

class Person {
  final String id;
  final String name;
  final int age;

  Person({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'ID: $id\nName: $name\nAge: $age';
  }
}

class Student extends Person {
  final double cgpa;
  final String semester;
  final String admissionDate;

  Student({
    required super.id,
    required super.name,
    required super.age,
    required this.cgpa,
    required this.semester,
    required this.admissionDate,
  }) {
    if (!cgpa.isFinite || cgpa < 0.0 || cgpa > 4.0) {
      throw ArgumentError(
        'CGPA must be between 0.0 and 4.0. Received: $cgpa',
      );
    }
  }

  @override
  String toString() {
    return 'Student Record\n'
        '${super.toString()}\n'
        'CGPA: ${cgpa.toStringAsFixed(2)}\n'
        'Semester: $semester\n'
        'Admission Date: $admissionDate';
  }
}

class Teacher extends Person {
  final double salary;
  final String designation;
  final String department;
  final String joiningDate;

  Teacher({
    required super.id,
    required super.name,
    required super.age,
    required this.salary,
    required this.designation,
    required this.department,
    required this.joiningDate,
  });

  @override
  String toString() {
    return 'Teacher Record\n'
        '${super.toString()}\n'
        'Salary: Rs. ${salary.toStringAsFixed(2)}\n'
        'Designation: $designation\n'
        'Department: $department\n'
        'Joining Date: $joiningDate';
  }
}

// Returns null when the requested ID does not exist.
Person? findById(List<Person> records, String id) {
  for (final person in records) {
    if (person.id == id) {
      return person;
    }
  }

  return null;
}

void main() {
  final students = <Student>[
    Student(
      id: 'S101',
      name: 'Ali Khan',
      age: 21,
      cgpa: 3.90,
      semester: 'Fa23',
      admissionDate: '2023-09-01',
    ),
    Student(
      id: 'S102',
      name: 'Sara Ahmed',
      age: 20,
      cgpa: 3.70,
      semester: 'Sp24',
      admissionDate: '2024-02-01',
    ),
    Student(
      id: 'S103',
      name: 'Hamza Shah',
      age: 22,
      cgpa: 3.80,
      semester: 'Fa23',
      admissionDate: '2023-09-01',
    ),
  ];

  final teachers = <Teacher>[
    Teacher(
      id: 'T101',
      name: 'Ahmed Raza',
      age: 35,
      salary: 95000.0,
      designation: 'Lecturer',
      department: 'Computer Science',
      joiningDate: '2020-08-15',
    ),
    Teacher(
      id: 'T102',
      name: 'Ayesha Noor',
      age: 40,
      salary: 150000.0,
      designation: 'Assistant Professor',
      department: 'Mathematics',
      joiningDate: '2017-03-10',
    ),
    Teacher(
      id: 'T103',
      name: 'Bilal Hussain',
      age: 48,
      salary: 220000.0,
      designation: 'Professor',
      department: 'Computer Science',
      joiningDate: '2012-09-01',
    ),
  ];

  print('=== CGPA Validation ===');

  try {
    Student(
      id: 'S104',
      name: 'Invalid Student',
      age: 20,
      cgpa: 4.50,
      semester: 'Fa24',
      admissionDate: '2024-09-01',
    );
  } on ArgumentError catch (error) {
    print(error);
  }

  print('\n=== Students with CGPA greater than 3.7 ===');

  students.where((student) => student.cgpa > 3.7).forEach((student) {
    print(
      'ID: ${student.id}, '
          'Name: ${student.name}, '
          'CGPA: ${student.cgpa.toStringAsFixed(2)}',
    );
  });

  print('\n=== Search Campus Records ===');

  // Repeated searches allow successful and unsuccessful results
  // to appear together in the same terminal screenshot.
  while (true) {
    stdout.write('\nEnter an ID, or press Enter to exit: ');

    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Program ended.');
      break;
    }

    final id = input.trim();

    final Person? result =
        findById(students, id) ?? findById(teachers, id);

    if (result == null) {
      print('No record found with ID $id');
    } else {
      print(result);
    }
  }
}