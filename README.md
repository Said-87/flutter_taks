# CSC303 Mobile Application Development Lab

Three projects developed for the CSC303 Mobile Application Development
lab assignment using Dart and Flutter.


## Projects

### 1. Campus Records Management

A Dart console application for managing student and teacher records.

**Features**

- Uses inheritance with Person, Student and Teacher classes.
- Stores students and teachers in separate lists.
- Searches both lists by ID.
- Displays complete details for matching records.
- Displays students whose CGPA is strictly greater than 3.7.
- Rejects invalid CGPA values using ArgumentError.
- Handles invalid student creation with try-catch.

### 2. Grade Dashboard

A Flutter application built using stateless widgets.

**Features**

- Displays six students in a two-column grid.
- Uses a reusable GradeCard widget.
- Calculates grades from student marks.
- Gives each grade a different background colour.
- Displays pass and fail icons.

| Marks | Grade |
|---|---|
| Below 50 | F |
| 50–59 | E |
| 60–69 | D |
| 70–79 | C |
| 80–89 | B |
| 90 and above | A |

### 3. Event Registration Form

A Flutter application built using a stateful registration form.

**Features**

- Accepts a full name and email address.
- Checks for empty input after trimming whitespace.
- Checks whether the email contains @.
- Displays validation messages using SnackBar.
- Displays a registration summary after success.
- Disables Register after successful registration.
- Provides Reset to clear the form and enable registration again.
- Disposes of both text controllers.

## Requirements

- Flutter SDK, stable channel
- Dart SDK, included with Flutter
- Android Studio or Visual Studio Code
- Chrome, an Android emulator, or a connected Android device

Check your setup:

```bash
flutter doctor
```

## Run the Projects

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/csc303-flutter-lab-assignment.git
cd csc303-flutter-lab-assignment
```

### Question 1

From the repository folder:

```bash
cd q1_campus_records
dart pub get
dart run bin/main.dart
```

Example search inputs:

- S101: an existing student
- T101: an existing teacher
- X999: a record that does not exist
- Blank input: exit the program

### Question 2

From the repository folder:

```bash
cd q2_grade_dashboard
flutter pub get
flutter run -d chrome
```

To select another available device, use:

```bash
flutter devices
flutter run
```

### Question 3

From the repository folder:

```bash
cd q3_registration_form
flutter pub get
flutter run -d chrome
```

To run on Android, start an emulator or connect a phone,
then select it using flutter run.

## Screenshots

Store the following screenshots in the screenshots folder:

| Filename | What it shows |
|---|---|
| q1_output.png | Successful and unsuccessful searches, plus the CGPA list |
| q1_validation.png | Invalid CGPA error message |
| q2_dashboard.png | Grade cards with different colours |
| q3_snackbar.png | Validation message for an empty name |
| q3_success.png | Successful registration and disabled Register button |

## Learning Outcomes

- Dart inheritance and constructors
- Lists, filtering and iteration
- Null safety and exception handling
- Stateless and stateful Flutter widgets
- Grid layouts and reusable components
- Text controllers, validation and state updates

## Academic Context

These projects were created for a university lab assignment.