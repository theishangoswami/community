import 'package:freezed_annotation/freezed_annotation.dart';

part 'gotra.freezed.dart';
part 'gotra.g.dart';

@freezed
class Gotra with _$Gotra {
  factory Gotra({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'gotra_name') required String gotraName,
  }) = _Gotra;

  factory Gotra.fromJson(Map<String, dynamic> json) => _$GotraFromJson(json);
}
