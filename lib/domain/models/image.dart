// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:speakyfox/domain/models/coordinates.dart';
import 'package:speakyfox/domain/models/database_file.dart';

enum ImageType {
  @JsonValue(0)
  none, //FIXME 0 is necessary because backend sends sometimes imageType = 0 here
  @JsonValue("Whole")
  whole,
  @JsonValue("Focus")
  focus,
  @JsonValue("Part")
  part
}

class Image extends DatabaseFile {
  ImageType? imageType;
  int order;
  Coordinates? coordinates;

  Image(
      {required String id,
      required String modified,
      required String modifiedBy,
      required String created,
      required String createdBy,
      required String deleted,
      required String deletedBy,
      required String bucketName,
      required String name,
      required int size,
      required String contentType,
      required DatabaseType type,
      required List<dynamic> metadata,
      required this.order,
      required this.coordinates,
      required this.imageType})
      : super(
          bucketName: bucketName,
          name: name,
          size: size,
          contentType: contentType,
          type: type,
          metadata: metadata,
          id: id,
          modified: modified,
          modifiedBy: modifiedBy,
          created: created,
          createdBy: createdBy,
          deleted: deleted,
          deletedBy: deletedBy,
        );

  @override
  String toString() {
    return 'Image(order: $order, coordinates: $coordinates)${super.toString()}';
  }
}
