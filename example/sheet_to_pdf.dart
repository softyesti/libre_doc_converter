// ignore_for_file: avoid_print

import 'dart:io';
import 'package:libre_doc_converter/libre_doc_converter.dart';

Future<void> main() async {
  final converter = LibreDocConverter(
    inputFile: File('assets/example_sheet.xlsx'),
  );

  try {
    final pdfFile = await converter.toPdf();
    print(pdfFile.path);
  } catch (e) {
    rethrow;
  }
}
