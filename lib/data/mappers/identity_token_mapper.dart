import 'package:speakyfox/data/dtos/identity_token_dto.dart';
import 'package:speakyfox/data/mappers/user_mapper.dart';
import 'package:speakyfox/domain/models/identity_token.dart';

extension IdentityTokenMapper on IdentityTokenDto {
  IdentityToken toIdentityToken() {
    return IdentityToken(expires: expires, accessToken: accessToken, refreshToken: refreshToken, user: user.toUser());
  }
}

extension IdentityTokenDtoMapper on IdentityToken {
  IdentityTokenDto toIdentityTokenDto() {
    return IdentityTokenDto(
        expires: expires, accessToken: accessToken, refreshToken: refreshToken, user: user.toUserDto());
  }
}
