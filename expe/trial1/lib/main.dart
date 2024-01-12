import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> values = ['Value 1', 'Value 2', 'Value 3', 'Value 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the values
            Text('Values:', style: TextStyle(fontSize: 18)),
            Column(
              children: values.map((value) => Text(value)).toList(),
            ),
            SizedBox(height: 20),

            // Button to generate and download PDF
            ElevatedButton(
              onPressed: () {
                // Choose the index of the value to download
                int selectedIndex = 0; // Change this index as needed
                downloadPDF(values[selectedIndex]);
              },
              child: Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadPDF(String selectedValue) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(selectedValue),
        );
      },
    ));

    // Get the download directory
    final directory = await getDownloadsDirectory();

    // Construct the path to save the PDF file
    final path = '${directory?.path}/example.pdf';

    // Save the PDF to a file
    File(path).writeAsBytesSync(await pdf.save());

    // Show a snackbar with the download path
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF downloaded to: $path'),
      ),
    );
  }
}
