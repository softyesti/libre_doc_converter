import 'dart:io';
import 'package:libre_doc_converter/libre_doc_converter.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final converter = LibreDocConverter(
      inputFile: File(
        'assets/example_document.docx',
      ),
    );

    setUp(() {});

    test('Input file exists', () {
      expect(converter.inputFile.existsSync(), isTrue);
    });

    test('Convert to pdf', () async {
      expect(await converter.toPdf(), isNotNull);
    });
  });
}
