import 'package:speakyfox/domain/models/audio.dart';
import 'package:speakyfox/domain/models/file.dart';
import 'package:speakyfox/domain/models/file_base.dart';
import 'package:speakyfox/domain/models/image.dart';
import 'package:speakyfox/domain/models/language.dart';

abstract class FileContainerBase {
  FileBase original;
  String id;
  FileState fileState;
  FileType fileType;
  double loadingProgress;
  LoadingState loadingState;

  FileContainerBase({
    required this.original,
    required this.id,
    required this.fileState,
    required this.fileType,
    required this.loadingProgress,
    required this.loadingState,
  });

  List<FileBase> getFiles();

  void setLoadingProgressForFile(FileBase file, double progress) {
    final List newFiles = getFiles().where((element) => element.state == FileState.neww).toList();
    if (newFiles.isNotEmpty) {
      loadingState = LoadingState.completed;
      loadingProgress = 100;
      return;
    }

    final fileIndex = newFiles.indexWhere((element) => element.id == file.id);

    if (fileIndex > -1) {
      final areaSize = 1 / newFiles.length;
      loadingProgress = ((fileIndex + 1) * areaSize * progress).roundToDouble();
    }
  }
}

class ImageContainer extends FileContainerBase {
  final FileType fileType = FileType.image;

  ImageType imageType = ImageType.whole;
  dynamic thumbnail;

  ImageContainer(
      {required FileBase original,
      required String id,
      required FileState fileState,
      required FileType fileType,
      required double loadingProgress,
      required LoadingState loadingState})
      : super(
            original: original,
            id: id,
            fileState: fileState,
            fileType: fileType,
            loadingProgress: loadingProgress,
            loadingState: loadingState);

  @override
  List<FileBase> getFiles() {
    throw UnimplementedError();
  }
}

class FileContainer extends FileContainerBase {
  FileType type = FileType.file;
  AudioType audioType = AudioType.word;
  LanguageType languageType = LanguageType.sourceLanguage;

  FileContainer(
      {required FileBase original,
      required String id,
      required FileState fileState,
      required FileType fileType,
      required double loadingProgress,
      required LoadingState loadingState})
      : super(
            original: original,
            id: id,
            fileState: fileState,
            fileType: fileType,
            loadingProgress: loadingProgress,
            loadingState: loadingState);

  @override
  List<FileBase> getFiles() {
    // TODO: implement getFiles
    throw UnimplementedError();
  }
}

