import 'package:freezed_annotation/freezed_annotation.dart';

part 'memberdetails.freezed.dart';
part 'memberdetails.g.dart';

@freezed
class MemberDetails with _$MemberDetails {
  factory MemberDetails({
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    @JsonKey(name: 'user_relation') required String userRelation,
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    @JsonKey(name: 'adhar_number') required String adhaarNumber,
  }) = _MemberDetails;

  factory MemberDetails.fromJson(Map<String, dynamic> json) =>
      _$MemberDetailsFromJson(json);
}
