import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void generatePDF(BuildContext context) async {
  final pdf = pw.Document();

  // Add your custom page layout here
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Logo
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("KUMARAKOM",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.Text("Date: ${DateTime.now()}",
                      style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 20),

              // Patient Details
              pw.Text("Patient Details",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Name: Salih T"),
              pw.Text("Address: Nadakkave, Kozhikode"),
              pw.Text("WhatsApp Number: +91 987654321"),

              pw.SizedBox(height: 20),

              // Treatment Details
              pw.Text("Treatment Details",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: ["Treatment", "Price", "Male", "Female", "Total"],
                data: [
                  ["Panchakarma", "₹230", "4", "-", "₹2,540"],
                  ["Njavara Kizhi Treatment", "₹230", "4", "-", "₹2,540"],
                  ["Panchakarma", "₹230", "-", "4", "₹2,540"],
                ],
              ),

              pw.SizedBox(height: 20),

              // Total and Balance
              pw.Text("Total Amount: ₹7,620",
                  style: pw.TextStyle(fontSize: 14)),
              pw.Text("Discount: ₹500", style: pw.TextStyle(fontSize: 14)),
              pw.Text("Advance: ₹1,200", style: pw.TextStyle(fontSize: 14)),
              pw.Text("Balance: ₹5,920",
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),

              pw.SizedBox(height: 30),
              pw.Text(
                "Thank you for choosing us!",
                style: pw.TextStyle(fontSize: 14, color: PdfColors.green),
              ),
            ],
          ),
        );
      },
    ),
  );

  // Save or Share the PDF
  final pdfBytes = await pdf.save();

  // Use the 'printing' package to preview or share
  await Printing.sharePdf(bytes: pdfBytes, filename: 'booking_details.pdf');
}

