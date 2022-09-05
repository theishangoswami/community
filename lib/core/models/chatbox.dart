import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'chatbox.freezed.dart';
part 'chatbox.g.dart';

@freezed
class ChatBoxModel with _$ChatBoxModel {
  ChatBoxModel._();
  factory ChatBoxModel({
    required String id,
    required String receiverId,
    required String senderId,
    required String message,
    required String date,
  }) = _ChatBoxModel;

  String get messageTime =>
      DateFormat.jm().format(DateTime.parse(date).toLocal());

  factory ChatBoxModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBoxModelFromJson(json);
}
