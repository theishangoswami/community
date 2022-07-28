import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
part 'district.g.dart';

@freezed
class District with _$District {
  factory District({
    required String id,
    @JsonKey(name: 'state_id') required String stateId,
    @JsonKey(name: 'district') required String districtName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
