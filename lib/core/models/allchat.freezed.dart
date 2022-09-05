// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allchat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllChat _$AllChatFromJson(Map<String, dynamic> json) {
  return _AllChat.fromJson(json);
}

/// @nodoc
mixin _$AllChat {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllChatCopyWith<AllChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllChatCopyWith<$Res> {
  factory $AllChatCopyWith(AllChat value, $Res Function(AllChat) then) =
      _$AllChatCopyWithImpl<$Res>;
  $Res call({String id, String? name, String? profile});
}

/// @nodoc
class _$AllChatCopyWithImpl<$Res> implements $AllChatCopyWith<$Res> {
  _$AllChatCopyWithImpl(this._value, this._then);

  final AllChat _value;
  // ignore: unused_field
  final $Res Function(AllChat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AllChatCopyWith<$Res> implements $AllChatCopyWith<$Res> {
  factory _$$_AllChatCopyWith(
          _$_AllChat value, $Res Function(_$_AllChat) then) =
      __$$_AllChatCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? name, String? profile});
}

/// @nodoc
class __$$_AllChatCopyWithImpl<$Res> extends _$AllChatCopyWithImpl<$Res>
    implements _$$_AllChatCopyWith<$Res> {
  __$$_AllChatCopyWithImpl(_$_AllChat _value, $Res Function(_$_AllChat) _then)
      : super(_value, (v) => _then(v as _$_AllChat));

  @override
  _$_AllChat get _value => super._value as _$_AllChat;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$_AllChat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllChat implements _AllChat {
  _$_AllChat({required this.id, required this.name, required this.profile});

  factory _$_AllChat.fromJson(Map<String, dynamic> json) =>
      _$$_AllChatFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? profile;

  @override
  String toString() {
    return 'AllChat(id: $id, name: $name, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllChat &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profile));

  @JsonKey(ignore: true)
  @override
  _$$_AllChatCopyWith<_$_AllChat> get copyWith =>
      __$$_AllChatCopyWithImpl<_$_AllChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllChatToJson(
      this,
    );
  }
}

abstract class _AllChat implements AllChat {
  factory _AllChat(
      {required final String id,
      required final String? name,
      required final String? profile}) = _$_AllChat;

  factory _AllChat.fromJson(Map<String, dynamic> json) = _$_AllChat.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get profile;
  @override
  @JsonKey(ignore: true)
  _$$_AllChatCopyWith<_$_AllChat> get copyWith =>
      throw _privateConstructorUsedError;
}
