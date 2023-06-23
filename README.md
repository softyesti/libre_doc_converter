# LibreDocConverter

A Dart/Flutter library for converting documents using libreoffice.

## Features

Convert from .doc, .docx, .ppt, .pptx to .pdf.

## Getting started

* Windows, Linux or macOS.
* LibreOffice application.

## Usage

The examples are present in the `/example` folder.

### Example: Doc to pdf

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
