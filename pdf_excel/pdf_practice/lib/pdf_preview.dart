import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreview extends StatefulWidget {
  const PdfPreview({super.key});

  @override
  State<PdfPreview> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Preview"),
        flexibleSpace: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)))),
        ),
      ),
      floatingActionButton: pdfButton(),
    );
  }

  Widget pdfButton() {
    return FloatingActionButton(
      onPressed: () {
        pdfViewer(context);
      },
      child: Icon(CupertinoIcons.tray_arrow_down),
    );
  }

  void pdfViewer(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Download PDF ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No")),
                TextButton(
                    onPressed: () {
                      generatePdf();
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            ));
  }

  Future<void> generatePdf() async {
    final List details = [
      {
        "Voter_SerialNumber": "1",
        "VoterId": "TOQ1603570",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "KRUPA PALLA",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "2",
        "VoterId": "TOQ0556599",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "VARALAXMI KARANAM",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "3",
        "VoterId": "TOQ0556409",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "PENTA RAO KARANAM Mother Name: SANYASI DEMUDU",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "4",
        "VoterId": "TOQ0615569",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "LAKSHMAN URDHANAA",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "5",
        "VoterId": "TOQ0517755",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "KARANAM SANYASARAO",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "6",
        "VoterId": "TOQ0517540",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "KARANAM BHASKARARAO",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "7",
        "VoterId": "TOQ0882597",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "SANTOSHI MIRIKITHI",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "8",
        "VoterId": "TOQ1671098",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "Siva Jagarapu",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "9",
        "VoterId": "TOQ1653955",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "Jayanthi Galla",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "10",
        "VoterId": "TOQ1716299",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "MERY MANDY",
        "outside_voter": true,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "11",
        "VoterId": "TOQ0556631",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "NOOKARATNAM KOTYADA",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "12",
        "VoterId": "TOQ0644816",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "PARVATHI KARRI",
        "outside_voter": false,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "15",
        "VoterId": "TOQ0517490",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "GENJI LAXMI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "16",
        "VoterId": "TOQ0644345",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "NAGAMANI KODI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "19",
        "VoterId": "TOQ0644360",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "VARALAKSHMI DOKALA",
        "outside_voter": true,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "20",
        "VoterId": "TOQ0644444",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "NAGARAJU MERAPUREDDI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "21",
        "VoterId": "TOQ0644881",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "BHASKARARAO MOSURI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "22",
        "VoterId": "TOQ0644428",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "YERRI NAIDU EARLI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "23",
        "VoterId": "TOQ0644386",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "MOHAN TANARI",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "24",
        "VoterId": "TOQ0644501",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "SATYAVATHI DOKULA",
        "outside_voter": null,
        "ContactNumber": null
      },
      {
        "Voter_SerialNumber": "181",
        "VoterId": "TOQ1242767",
        "PartyInclination": {"PartyName": "Telugu Desam Party"},
        "Name": "CHITTEMMA MOSURI",
        "outside_voter": null,
        "ContactNumber": null
      }
    ];

    final doc = pw.Document();

    doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.TableHelper.fromTextArray(
                context: context,
                data: const <List<String>>[
                  <String>['Date', 'PDF Version', 'Acrobat Version'],
                ],
              ),
              pw.ListView.builder(
                  itemBuilder: (context, index) {
                    return pw.Text(details[index]['Name']);
                  },
                  itemCount: 30)
            ]);
      },
    ));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
