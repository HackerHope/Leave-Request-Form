import 'package:flutter/material.dart';
import 'formPage.dart' hide Form;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LeaveRequestForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
