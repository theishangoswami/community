import 'package:freezed_annotation/freezed_annotation.dart';

part 'userstatus.freezed.dart';
part 'userstatus.g.dart';

@freezed
class UserStatus with _$UserStatus {
  factory UserStatus({
    @JsonKey(name: 'id') required String userId,
    required String status,
    @JsonKey(name: 'usertype') required String userType,
  }) = _UserStatus;

  factory UserStatus.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFromJson(json);
}
