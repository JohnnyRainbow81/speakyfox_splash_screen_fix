// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:speakyfox/domain/models/user.dart';

class IdentityToken {
 int expires;
 String accessToken;
 String refreshToken;
  User user;
  IdentityToken({
    required this.expires,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
}
