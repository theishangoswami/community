import 'package:freezed_annotation/freezed_annotation.dart';

part 'allchat.freezed.dart';
part 'allchat.g.dart';

@freezed
class AllChat with _$AllChat {
  factory AllChat({
    required String id,
    required String? name,
    required String? profile,
  }) = _AllChat;

  factory AllChat.fromJson(Map<String, dynamic> json) =>
      _$AllChatFromJson(json);
}
