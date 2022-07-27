import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_detail.freezed.dart';
part 'state_detail.g.dart';

@freezed
class StateDetail with _$StateDetail {
  factory StateDetail({
    required String id,
    @JsonKey(name: 'state_name') required String stateName,
  }) = _StateDetail;

  factory StateDetail.fromJson(Map<String, dynamic> json) =>
      _$StateDetailFromJson(json);
}
