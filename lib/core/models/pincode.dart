import 'package:freezed_annotation/freezed_annotation.dart';

part 'pincode.freezed.dart';
part 'pincode.g.dart';

@freezed
class Pincode with _$Pincode {
  factory Pincode({
    required String id,
    @JsonKey(name: 'city_id') required String cityId,
    @JsonKey(name: 'pincode') required String pinCode,
  }) = _Pincode;

  factory Pincode.fromJson(Map<String, dynamic> json) =>
      _$PincodeFromJson(json);
}
