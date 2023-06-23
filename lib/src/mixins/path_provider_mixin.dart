import 'dart:io';
import 'package:path/path.dart' as path;

/// Mixin which gives the paths to libreoffice and temp folder.
mixin PathProviderMixin {
  /// Returns the path of the libreoffice executable.
  /// The executable is used to convert the files.
  /// Throws an [UnsupportedError] if the platform is not supported.
  /// Throws a [FileSystemException] if the executable is not found.
  /// Supported platforms: Windows, Linux, MacOS.
  Future<String> getSofficePath() async {
    late String sofficePath;

    const windowsPath = r'C:\Program Files\LibreOffice\program\soffice.exe';
    const linuxPath = '/usr/bin/libreoffice';
    const macPath = '/Applications/LibreOffice.app/Contents/MacOS/soffice';

    if (Platform.isWindows) {
      sofficePath = path.normalize(windowsPath);
    } else if (Platform.isLinux) {
      sofficePath = path.normalize(linuxPath);
    } else if (Platform.isMacOS) {
      sofficePath = path.normalize(macPath);
    } else {
      throw UnsupportedError('Unsupported platform.');
    }

    if (File(sofficePath).existsSync()) {
      return path.normalize(sofficePath);
    } else {
      throw FileSystemException(
        'LibreOffice not found.',
        sofficePath,
      );
    }
  }

  /// Returns the path of the temp folder.
  /// The temp folder is used to store the converted files.
  /// Throws a [FileSystemException] if the temp folder is not found.
  String getTempPath() {
    final tempPath = path.normalize(Directory.systemTemp.path);

    if (Directory(tempPath).existsSync()) {
      return tempPath;
    } else {
      throw FileSystemException(
        'Temp folder not found.',
        tempPath,
      );
    }
  }
}
