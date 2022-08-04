class Video {
  String id;
  String companyId;
  String forwards;
  String likes;
  String url;
  String title;
  String distance;
  bool isOpen;
  String shortDescription;
  List<String> categories;
  List<String> hashTags;
  String userImage;
  String userName;
  String userRatingAmount;
  Video({
    required this.id,
    required this.companyId,
    required this.forwards,
    required this.likes,
    required this.url,
    required this.title,
    required this.distance,
    required this.isOpen,
    required this.shortDescription,
    required this.categories,
    required this.hashTags,
    required this.userImage,
    required this.userName,
    required this.userRatingAmount,
  });
}
