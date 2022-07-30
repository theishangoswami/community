import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    String? gender,
    @JsonKey(name: 'father_name') String? fatherName,
    @JsonKey(name: 'mother_name') String? motherName,
    @JsonKey(name: 'brother_name') String? brotherName,
    @JsonKey(name: 'sister_name') String? sisterName,
    String? education,
    @JsonKey(name: 'adhar_number') String? adharNumber,
    @JsonKey(name: 'passport_number') String? passportNumber,
    String? password,
    @JsonKey(name: 'registration_date') String? registrationDate,
    @JsonKey(name: 'community_id') String? communityId,
    @JsonKey(name: 'society_id') String? societyId,
    @JsonKey(name: 'country_id') String? countryId,
    @JsonKey(name: 'state_id') String? stateId,
    @JsonKey(name: 'city_id') String? cityId,
    @JsonKey(name: 'district_id') String? districtId,
    @JsonKey(name: 'pincode_id') String? pinCodeId,
    String? address,
    String? profile,
    String? status,
    String? otp,
    @JsonKey(name: 'usertype') String? userType,
    @JsonKey(name: 'refferal_code') String? referralCode,
    @JsonKey(name: 'joining_id') String? joiningId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
