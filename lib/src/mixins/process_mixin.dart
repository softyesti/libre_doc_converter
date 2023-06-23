import 'dart:convert';
import 'dart:io';

/// Mixin which starts a process.
mixin ProcessMixin {
  /// Starts a process with the given [executable] and [arguments].
  /// Throws a [ProcessException] if the process fails.
  Future<Process> startProcess({
    required String executable,
    required List<String> arguments,
  }) async {
    try {
      final process = await Process.start(executable, arguments);
      if (await process.exitCode == 0) {
        return process;
      } else {
        final error = await process.stderr
            .transform(const Utf8Decoder(allowMalformed: true))
            .join();

        throw ProcessException(
          executable,
          arguments,
          error,
        );
      }
    } catch (e) {
      throw ProcessException(
        executable,
        arguments,
        e.toString(),
      );
    }
  }
}
