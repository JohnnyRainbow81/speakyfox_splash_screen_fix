// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

//Just for reference
// "id": 5,
//     "title": "Dürum Döner",
//     "shortDescription": "Kebab vom Holzkohlegrill im hausgemachten Brot gerollt für 4,90 €.",
//     "distance": "1,2 km",
//     "forwards": 32,
//     "likes": 1229,
//     "hashTags": "kebab, döner, dürum ",
//     "userImage": "https://i.imgur.com/l8RDyNt.jpg",
//     "userName": "Yalcin Döner",
//     "userRatingAmount": 221
class VideoDTO {
  int? id;
  String? companyId;
  int? forwards;
  int? likes;
  String? url;
  String? title;
  String? distance;
  bool? isOpen;
  String? shortDescription;
  String? hashTags;
  List<String>? categories = [];
  String? userImage;
  String? userName;
  int? userRatingAmount;
  VideoDTO({
    this.id,
    this.companyId,
    this.forwards,
    this.likes,
    this.url,
    this.title,
    this.distance,
    this.isOpen,
    this.shortDescription,
    this.hashTags,
    this.categories,
    this.userImage,
    this.userName,
    this.userRatingAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'forwards': forwards,
      'likes': likes,
      'url': url,
      'title': title,
      'distance': distance,
      'isOpen': isOpen,
      'shortDescription': shortDescription,
      'hashTags': hashTags,
      'categories': categories,
      'userImage': userImage,
      'userName': userName,
      'userRatingAmount': userRatingAmount,
    };
  }

  factory VideoDTO.fromMap(Map<String, dynamic> map) {
    return VideoDTO(
      id: map['id'] != null ? map['id'] as int : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      forwards: map['forwards'] != null ? map['forwards'] as int : null,
      likes: map['likes'] != null ? map['likes'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      distance: map['distance'] != null ? map['distance'] as String : null,
      isOpen: map['isOpen'] != null ? map['isOpen'] as bool : null,
      shortDescription: map['shortDescription'] != null ? map['shortDescription'] as String : null,
      hashTags: map['hashTags'] != null ? map['hashTags'] as String : null,
      categories: map['categories'] != null ? List<String>.from((map['categories'] as List<String>)) : null,
      userImage: map['userImage'] != null ? map['userImage'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userRatingAmount: map['userRatingAmount'] != null ? map['userRatingAmount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoDTO.fromJson(String source) => VideoDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant VideoDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.companyId == companyId &&
      other.forwards == forwards &&
      other.likes == likes &&
      other.url == url &&
      other.title == title &&
      other.distance == distance &&
      other.isOpen == isOpen &&
      other.shortDescription == shortDescription &&
      other.hashTags == hashTags &&
      listEquals(other.categories, categories) &&
      other.userImage == userImage &&
      other.userName == userName &&
      other.userRatingAmount == userRatingAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      companyId.hashCode ^
      forwards.hashCode ^
      likes.hashCode ^
      url.hashCode ^
      title.hashCode ^
      distance.hashCode ^
      isOpen.hashCode ^
      shortDescription.hashCode ^
      hashTags.hashCode ^
      categories.hashCode ^
      userImage.hashCode ^
      userName.hashCode ^
      userRatingAmount.hashCode;
  }

  @override
  String toString() {
    return 'VideoDTO(id: $id, companyId: $companyId, forwards: $forwards, likes: $likes, url: $url, title: $title, distance: $distance, isOpen: $isOpen, shortDescription: $shortDescription, hashTags: $hashTags, categories: $categories, userImage: $userImage, userName: $userName, userRatingAmount: $userRatingAmount)';
  }
}
