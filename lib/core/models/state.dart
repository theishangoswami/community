import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class State with _$State {
  factory State({
    required String id,
    @JsonKey(name: 'state_name') required String stateName,
  }) = _State;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}
