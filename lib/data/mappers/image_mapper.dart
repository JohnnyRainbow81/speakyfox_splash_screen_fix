import 'package:speakyfox/data/mappers/coordinates_mapper.dart';
import 'package:speakyfox/data/responses/image_response.dart';
import 'package:speakyfox/domain/models/image.dart';

extension ImageMapper on ImageResponse {
  Image toImage() {
    return Image(
        id: id,
        modified: modified ?? "",
        modifiedBy: modifiedBy ?? "",
        created: created ??"",
        createdBy: createdBy ??"",
        deleted: deleted ??"",
        deletedBy: deletedBy ??"",
        bucketName: bucketName,
        name: name,
        size: size,
        contentType: contentType,
        type: type,
        metadata: metadata ?? [],
        order: order,
        coordinates: coordinates.toCoordinates(),
        imageType: imageType);
  }
}
