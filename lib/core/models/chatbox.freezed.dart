// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chatbox.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatBoxModel _$ChatBoxModelFromJson(Map<String, dynamic> json) {
  return _ChatBoxModel.fromJson(json);
}

/// @nodoc
mixin _$ChatBoxModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  String get receiverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_id')
  String get senderId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBoxModelCopyWith<ChatBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBoxModelCopyWith<$Res> {
  factory $ChatBoxModelCopyWith(
          ChatBoxModel value, $Res Function(ChatBoxModel) then) =
      _$ChatBoxModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'from_id') String receiverId,
      @JsonKey(name: 'to_id') String senderId,
      String message,
      String date});
}

/// @nodoc
class _$ChatBoxModelCopyWithImpl<$Res> implements $ChatBoxModelCopyWith<$Res> {
  _$ChatBoxModelCopyWithImpl(this._value, this._then);

  final ChatBoxModel _value;
  // ignore: unused_field
  final $Res Function(ChatBoxModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? receiverId = freezed,
    Object? senderId = freezed,
    Object? message = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatBoxModelCopyWith<$Res>
    implements $ChatBoxModelCopyWith<$Res> {
  factory _$$_ChatBoxModelCopyWith(
          _$_ChatBoxModel value, $Res Function(_$_ChatBoxModel) then) =
      __$$_ChatBoxModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'from_id') String receiverId,
      @JsonKey(name: 'to_id') String senderId,
      String message,
      String date});
}

/// @nodoc
class __$$_ChatBoxModelCopyWithImpl<$Res>
    extends _$ChatBoxModelCopyWithImpl<$Res>
    implements _$$_ChatBoxModelCopyWith<$Res> {
  __$$_ChatBoxModelCopyWithImpl(
      _$_ChatBoxModel _value, $Res Function(_$_ChatBoxModel) _then)
      : super(_value, (v) => _then(v as _$_ChatBoxModel));

  @override
  _$_ChatBoxModel get _value => super._value as _$_ChatBoxModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? receiverId = freezed,
    Object? senderId = freezed,
    Object? message = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ChatBoxModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatBoxModel extends _ChatBoxModel {
  _$_ChatBoxModel(
      {required this.id,
      @JsonKey(name: 'from_id') required this.receiverId,
      @JsonKey(name: 'to_id') required this.senderId,
      required this.message,
      required this.date})
      : super._();

  factory _$_ChatBoxModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatBoxModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'from_id')
  final String receiverId;
  @override
  @JsonKey(name: 'to_id')
  final String senderId;
  @override
  final String message;
  @override
  final String date;

  @override
  String toString() {
    return 'ChatBoxModel(id: $id, receiverId: $receiverId, senderId: $senderId, message: $message, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatBoxModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.receiverId, receiverId) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(receiverId),
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ChatBoxModelCopyWith<_$_ChatBoxModel> get copyWith =>
      __$$_ChatBoxModelCopyWithImpl<_$_ChatBoxModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatBoxModelToJson(
      this,
    );
  }
}

abstract class _ChatBoxModel extends ChatBoxModel {
  factory _ChatBoxModel(
      {required final String id,
      @JsonKey(name: 'from_id') required final String receiverId,
      @JsonKey(name: 'to_id') required final String senderId,
      required final String message,
      required final String date}) = _$_ChatBoxModel;
  _ChatBoxModel._() : super._();

  factory _ChatBoxModel.fromJson(Map<String, dynamic> json) =
      _$_ChatBoxModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'from_id')
  String get receiverId;
  @override
  @JsonKey(name: 'to_id')
  String get senderId;
  @override
  String get message;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_ChatBoxModelCopyWith<_$_ChatBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}
