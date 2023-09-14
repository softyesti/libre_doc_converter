# LibreDocConverter

A Dart/Flutter library for converting documents using libreoffice.

## Features

Convert from .doc, .docx, .ppt, .pptx, .xls, .xlsx to .pdf.

## Getting started

* Windows, Linux or macOS.
* LibreOffice application.

## Usage

The examples are present in the `/example` folder.

### Example: Document to pdf

```dart
import 'dart:io';
import 'package:libre_doc_converter/libre_doc_converter.dart';

Future<void> main() async {
  final converter = LibreDocConverter(
    inputFile: File('assets/example_document.docx'),
  );

  try {
    final pdfFile = await converter.toPdf();
    print(pdfFile.path);
  } catch (e) {
    rethrow;
  }
}
```

```dart
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
```
