import '../../domain/models/video.dart';
import '../dto/video_dto.dart';

extension VideoMapper on VideoDTO {
  Video toDomain() { 
    return Video(
      id: id.toString(),
      companyId: companyId ?? "",
      categories: categories ?? [],
      distance: distance ?? "",
      forwards: forwards.toString(),
      hashTags: hashTags?.split(' ') ?? [],
      isOpen: isOpen ?? true,
      likes: likes.toString(),
      shortDescription: shortDescription ?? "No description",
      title: title ?? "No title",
      url: url ?? "No URL",
      userImage: userImage ?? "",
      userName: userName ?? "No Name",
      userRatingAmount: userRatingAmount.toString()
    );
  }
}

extension VideoDTOMapper on Video {
  VideoDTO toDTO() { 
    return VideoDTO(
      id: int.tryParse(id)?? 0,
      companyId: companyId,
      categories: categories,
      distance: distance,
      forwards: int.tryParse(forwards) ?? 0,
      hashTags: hashTags.toString(),
      isOpen: isOpen,
      likes: int.tryParse(likes) ?? 0,
      shortDescription: shortDescription,
      title: title,
      url: url,
      userImage: userImage,
      userName: userName,
      userRatingAmount: int.tryParse(userRatingAmount) ?? 0
    );
  }
}