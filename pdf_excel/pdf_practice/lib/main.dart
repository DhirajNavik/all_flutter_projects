import 'package:flutter/material.dart';
import 'package:pdf_practice/pdf_preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PdfPreview());
  }
}
