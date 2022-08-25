import 'package:speakyfox/data/mappers/coordinates_mapper.dart';
import 'package:speakyfox/data/dtos/image_dto.dart';
import 'package:speakyfox/domain/models/image.dart';

extension ImageMapper on ImageDto {
  Image toImage() {
    return Image(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ?? "",
        createdBy: createdBy ?? "",
        deleted: deleted ?? "",
        deletedBy: deletedBy ?? "",
        bucketName: bucketName ?? "",
        name: name,
        size: size,
        contentType: contentType,
        type: type,
        metadata: metadata ?? [],
        order: order ?? 0,
        coordinates: coordinates?.toCoordinates(),
        imageType: imageType);
  }
}
