// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userstatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) {
  return _UserStatus.fromJson(json);
}

/// @nodoc
mixin _$UserStatus {
  @JsonKey(name: 'id')
  String get userId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'usertype')
  String get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatusCopyWith<UserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatusCopyWith<$Res> {
  factory $UserStatusCopyWith(
          UserStatus value, $Res Function(UserStatus) then) =
      _$UserStatusCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String userId,
      String status,
      @JsonKey(name: 'usertype') String userType});
}

/// @nodoc
class _$UserStatusCopyWithImpl<$Res> implements $UserStatusCopyWith<$Res> {
  _$UserStatusCopyWithImpl(this._value, this._then);

  final UserStatus _value;
  // ignore: unused_field
  final $Res Function(UserStatus) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? status = freezed,
    Object? userType = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserStatusCopyWith<$Res>
    implements $UserStatusCopyWith<$Res> {
  factory _$$_UserStatusCopyWith(
          _$_UserStatus value, $Res Function(_$_UserStatus) then) =
      __$$_UserStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String userId,
      String status,
      @JsonKey(name: 'usertype') String userType});
}

/// @nodoc
class __$$_UserStatusCopyWithImpl<$Res> extends _$UserStatusCopyWithImpl<$Res>
    implements _$$_UserStatusCopyWith<$Res> {
  __$$_UserStatusCopyWithImpl(
      _$_UserStatus _value, $Res Function(_$_UserStatus) _then)
      : super(_value, (v) => _then(v as _$_UserStatus));

  @override
  _$_UserStatus get _value => super._value as _$_UserStatus;

  @override
  $Res call({
    Object? userId = freezed,
    Object? status = freezed,
    Object? userType = freezed,
  }) {
    return _then(_$_UserStatus(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStatus implements _UserStatus {
  _$_UserStatus(
      {@JsonKey(name: 'id') required this.userId,
      required this.status,
      @JsonKey(name: 'usertype') required this.userType});

  factory _$_UserStatus.fromJson(Map<String, dynamic> json) =>
      _$$_UserStatusFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String userId;
  @override
  final String status;
  @override
  @JsonKey(name: 'usertype')
  final String userType;

  @override
  String toString() {
    return 'UserStatus(userId: $userId, status: $status, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserStatus &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.userType, userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(userType));

  @JsonKey(ignore: true)
  @override
  _$$_UserStatusCopyWith<_$_UserStatus> get copyWith =>
      __$$_UserStatusCopyWithImpl<_$_UserStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStatusToJson(
      this,
    );
  }
}

abstract class _UserStatus implements UserStatus {
  factory _UserStatus(
          {@JsonKey(name: 'id') required final String userId,
          required final String status,
          @JsonKey(name: 'usertype') required final String userType}) =
      _$_UserStatus;

  factory _UserStatus.fromJson(Map<String, dynamic> json) =
      _$_UserStatus.fromJson;

  @override
  @JsonKey(name: 'id')
  String get userId;
  @override
  String get status;
  @override
  @JsonKey(name: 'usertype')
  String get userType;
  @override
  @JsonKey(ignore: true)
  _$$_UserStatusCopyWith<_$_UserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
