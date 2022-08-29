// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignoreforfile: publicmemberapidocs, sortconstructorsfirst

import 'package:speakyfox/domain/models/file.dart';
import 'package:speakyfox/domain/models/file_container_base.dart';

enum FileState { neww, existing }

enum LoadingState { initial, waiting, querying, loading, erroneous, completed }

abstract class FileBase {
  String id;
  FileContainerBase parent;
  String description;
  LoadingState loadingState;
  String kind;
  FileState state;
  FileType fileType;
  String name;
  int size;
  String mimeType;
  late String date;
  dynamic source;
  double loadingProgress;
  String dataUrl;

  FileBase({
    required this.id,
    required this.parent,
    required this.description,
    required this.loadingState,
    required this.kind,
    required this.state,
    required this.fileType,
    required this.name,
    required this.size,
    required this.mimeType,
    required this.source,
    required this.loadingProgress,
    required this.dataUrl,
  }) {
    date = DateTime.now().toUtc().toIso8601String();
  }
}

class NewFile extends FileBase {
  FileState state = FileState.neww;
  FileType fileType = FileType.file;

  NewFile(
      {required String id,
      required parent,
      required String description,
      required loadingState,
      required String kind,
      required state,
      required fileType,
      required String name,
      required int size,
      required String mimeType,
      required source,
      required double loadingProgress,
      required String dataUrl})
      : super(
            id: id,
            parent: parent,
            description: description,
            loadingState: loadingState,
            kind: kind,
            state: state,
            fileType: fileType,
            name: name,
            size: size,
            mimeType: mimeType,
            source: source,
            loadingProgress: loadingProgress,
            dataUrl: dataUrl);
}

class ExistingFile extends FileBase {
  FileState state = FileState.existing;
  FileType fileType = FileType.file;

  ExistingFile(
      {required String id,
      required parent,
      required String description,
      required loadingState,
      required String kind,
      required state,
      required fileType,
      required String name,
      required int size,
      required String mimeType,
      required source,
      required double loadingProgress,
      required String dataUrl})
      : super(
            id: id,
            parent: parent,
            description: description,
            loadingState: loadingState,
            kind: kind,
            state: state,
            fileType: fileType,
            name: name,
            size: size,
            mimeType: mimeType,
            source: source,
            loadingProgress: loadingProgress,
            dataUrl: dataUrl);
}

class NewImage extends FileBase {
  FileState state = FileState.neww;
  FileType fileType = FileType.image;

  NewImage(
      {required String id,
      required parent,
      required String description,
      required loadingState,
      required String kind,
      required state,
      required fileType,
      required String name,
      required int size,
      required String mimeType,
      required source,
      required double loadingProgress,
      required String dataUrl})
      : super(
            id: id,
            parent: parent,
            description: description,
            loadingState: loadingState,
            kind: kind,
            state: state,
            fileType: fileType,
            name: name,
            size: size,
            mimeType: mimeType,
            source: source,
            loadingProgress: loadingProgress,
            dataUrl: dataUrl);
}

class ExistingImage extends FileBase {
  FileState state = FileState.neww;
  FileType fileType = FileType.image;

  ExistingImage(
      {required String id,
      required parent,
      required String description,
      required loadingState,
      required String kind,
      required state,
      required fileType,
      required String name,
      required int size,
      required String mimeType,
      required source,
      required double loadingProgress,
      required String dataUrl})
      : super(
            id: id,
            parent: parent,
            description: description,
            loadingState: loadingState,
            kind: kind,
            state: state,
            fileType: fileType,
            name: name,
            size: size,
            mimeType: mimeType,
            source: source,
            loadingProgress: loadingProgress,
            dataUrl: dataUrl);
}