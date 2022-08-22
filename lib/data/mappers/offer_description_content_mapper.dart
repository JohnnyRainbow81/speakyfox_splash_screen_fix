import 'package:speakyfox/data/dtos/offer_description_content_dto.dart';
import 'package:speakyfox/domain/models/offer_description_content.dart';

extension OfferDescriptionContentMapper on OfferDescriptionContentDto {
  OfferDescriptionContent toOfferDescriptionContent() {
    return OfferDescriptionContent(content: content, bulletPoints: bulletPoints);
  }
}
