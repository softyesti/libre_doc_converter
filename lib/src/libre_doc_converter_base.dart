import 'dart:io';
import 'package:libre_doc_converter/src/mixins/path_provider_mixin.dart';
import 'package:libre_doc_converter/src/mixins/process_mixin.dart';
import 'package:path/path.dart' as path;

/// Base class for LibreDocConverter.
final class LibreDocConverter with PathProviderMixin, ProcessMixin {
  /// Creates a LibreDocConverter.
  /// The [inputFile] is the file to convert.
  LibreDocConverter({
    required this.inputFile,
  });

  /// The file to convert.
  final File inputFile;

  /// Converts the [inputFile] to pdf.
  /// Throws a [FileSystemException] if the [inputFile] is not found.
  /// Throws a [FileSystemException] if the converted file is not found.
  Future<File> toPdf() async {
    if (inputFile.existsSync()) {
      final sofficePath = await getSofficePath();
      final tempPath = getTempPath();

      final inputFilePath = path.normalize(inputFile.path);

      final process = startProcess(
        executable: sofficePath,
        arguments: [
          '--headless',
          '--convert-to',
          'pdf',
          inputFilePath,
          '--outdir',
          tempPath,
        ],
      );

      return process.then((value) {
        final outputFilePath = path.normalize(
          path.join(
            tempPath,
            path.setExtension(
              path.basenameWithoutExtension(inputFilePath),
              '.pdf',
            ),
          ),
        );

        final outputFile = File(outputFilePath);
        if (outputFile.existsSync()) {
          return outputFile;
        } else {
          throw FileSystemException(
            'Converted file not found.',
            outputFilePath,
          );
        }
      });
    } else {
      throw FileSystemException(
        'Input file not found.',
        inputFile.path,
      );
    }
  }
}
