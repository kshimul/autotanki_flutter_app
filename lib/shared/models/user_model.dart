import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// Role enum — exact values from Swagger (no TECHNICIAN)
enum UserRole {
  @JsonValue('USER') user,
  @JsonValue('ADMIN') admin,
  @JsonValue('SUPER_ADMIN') superAdmin,
  @JsonValue('SUPPORT') support,
  @JsonValue('TECHNICIAN') technician,
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? fullName,
    required String email,
    String? phone,
    @Default(UserRole.user) UserRole role,
    String? avatarUrl,
    String? address,
    bool? suspended,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// FCM token registration — requires token + platform (Swagger-verified)
@freezed
class FcmTokenRequest with _$FcmTokenRequest {
  const factory FcmTokenRequest({
    required String token,
    required String platform, // 'android' | 'ios' | 'web'
  }) = _FcmTokenRequest;

  factory FcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenRequestFromJson(json);
}
