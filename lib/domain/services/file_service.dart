import 'package:flutter/foundation.dart';
import 'package:speakyfox/domain/services/language_service.dart';

import '../../app/utilities.dart';

class FileService {
  int maximumFileSize = 1024 * 1024 * 50; // 50 MB,
  List<String> allowedFileTypes = [];

  void uploadFiles() {
    throw UnimplementedError();
  }

  void tranformFiles() {
    throw UnimplementedError();
  }

  void previewFiles() {
    throw UnimplementedError();
  }

  void readFiles() {
    throw UnimplementedError();
  }

  void _readFilesInner() {
    throw UnimplementedError();
  }

  static String getContentTypeByMimeType(String mimeType) {
    switch (mimeType) {
      case 'image/bmp':
      case 'image/gif':
      case 'image/jpeg':
      case 'image/png':
      case 'image/tiff':
      case 'image/svg+xml':
        return 'Image';
      case 'video/x-msvideo':
      case 'video/mpeg':
      case 'video/webm':
      case 'video/mp4':
        return 'Video';
      case 'audio/wav':
      case 'audio/mpeg':
        return 'Audio';
      case 'application/msword':
      case 'application/vnd.openxmlformats-officedocument. wordprocessingml.document':
        return 'Word';
      case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
      case 'application/vnd.ms-excel':
        return 'Excel';
      case 'application/zip':
      case 'application/x-7z-compressed':
      case 'application/x-rar-compressed':
        return 'Archive';
      case 'application/ms-powerpoint':
      case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        return 'Powerpoint';
      case 'application/pdf':
        return 'Pdf';
      case 'application/text':
      case 'application/rtf':
        return 'Text';
      default:
        debugPrint('Unkown mime type detected');
        return 'Unkown';
    }
  }

  static getMimeTypeByFileName(String fileName) {
    final fileExtension = getFileExtension(fileName);
    switch (fileExtension) {
      case 'AVI':
        return 'video/x-msvideo';
      case 'BMP':
        return 'image/bmp';
      case 'GIF':
        return 'image/gif';
      case 'JPEG':
      case 'JPG':
        return 'image/jpeg';
      case 'MP3':
        return 'audio/mpeg';
      case 'MPEG':
        return 'video/mpeg';
      case 'PNG':
        return 'image/png';
      case 'PDF':
        return 'application/pdf';
      case 'SVG':
        return 'image/svg+xml';
      case 'TIF':
      case 'TIFF':
        return 'image/tiff';
      case 'WAV':
        return 'audio/wav';
      case 'WEBM':
        return 'video/webm';
      case 'ZIP':
        return 'application/zip';
      case '7Z':
        return 'application/x-7z-compressed';
      case 'XLSX':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'XLS':
        return 'application/vnd.ms-excel';
      case 'RAR':
        return 'application/x-rar-compressed';
      case 'PPTX':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      case 'PPT':
        return 'application/ms-powerpoint';
      case 'RTF':
        return 'application/rtf';
      case 'MP4':
        return 'video/mp4';
      case 'DOCX':
        return 'application/vnd.openxmlformats-officedocument. wordprocessingml.document';
      case 'DOC':
        return 'application/msword';
      case 'TXT':
        return 'application/text';
      default:
        debugPrint('Unkown file extension detected');
        return 'unknown';
    }
  }

  static String generateGuid() {
    return Uuid.generateV4();
  }

  static String cleanFileName(String fileName) {
    return fileName.replaceAll(' ', '').replaceAll('&', '').replaceAll('%', '').replaceAll(';', '').replaceAll('?', '');
  }

  static String getFileExtension(String fileName) {
    if (fileName.isEmpty) {
      return '';
    } else {
      return fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase();
    }
  }
}
