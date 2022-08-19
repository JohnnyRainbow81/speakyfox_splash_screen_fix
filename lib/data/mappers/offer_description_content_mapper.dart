import 'package:speakyfox/data/responses/offer_description_content_response.dart';
import 'package:speakyfox/domain/models/offer_description_content.dart';

extension OfferDescriptionContentMapper on OfferDescriptionContentResponse {
  OfferDescriptionContent toOfferDescriptionContent() {
    return OfferDescriptionContent(content: content, bulletPoints: bulletPoints);
  }
}
