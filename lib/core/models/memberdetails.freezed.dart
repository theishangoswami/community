// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memberdetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberDetails _$MemberDetailsFromJson(Map<String, dynamic> json) {
  return _MemberDetails.fromJson(json);
}

/// @nodoc
mixin _$MemberDetails {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_relation')
  String get userRelation => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'adhar_number')
  String get adhaarNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberDetailsCopyWith<MemberDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberDetailsCopyWith<$Res> {
  factory $MemberDetailsCopyWith(
          MemberDetails value, $Res Function(MemberDetails) then) =
      _$MemberDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      String name,
      @JsonKey(name: 'user_relation') String userRelation,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'adhar_number') String adhaarNumber});
}

/// @nodoc
class _$MemberDetailsCopyWithImpl<$Res>
    implements $MemberDetailsCopyWith<$Res> {
  _$MemberDetailsCopyWithImpl(this._value, this._then);

  final MemberDetails _value;
  // ignore: unused_field
  final $Res Function(MemberDetails) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? userRelation = freezed,
    Object? mobileNumber = freezed,
    Object? adhaarNumber = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userRelation: userRelation == freezed
          ? _value.userRelation
          : userRelation // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adhaarNumber: adhaarNumber == freezed
          ? _value.adhaarNumber
          : adhaarNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MemberDetailsCopyWith<$Res>
    implements $MemberDetailsCopyWith<$Res> {
  factory _$$_MemberDetailsCopyWith(
          _$_MemberDetails value, $Res Function(_$_MemberDetails) then) =
      __$$_MemberDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      String name,
      @JsonKey(name: 'user_relation') String userRelation,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'adhar_number') String adhaarNumber});
}

/// @nodoc
class __$$_MemberDetailsCopyWithImpl<$Res>
    extends _$MemberDetailsCopyWithImpl<$Res>
    implements _$$_MemberDetailsCopyWith<$Res> {
  __$$_MemberDetailsCopyWithImpl(
      _$_MemberDetails _value, $Res Function(_$_MemberDetails) _then)
      : super(_value, (v) => _then(v as _$_MemberDetails));

  @override
  _$_MemberDetails get _value => super._value as _$_MemberDetails;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? userRelation = freezed,
    Object? mobileNumber = freezed,
    Object? adhaarNumber = freezed,
  }) {
    return _then(_$_MemberDetails(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userRelation: userRelation == freezed
          ? _value.userRelation
          : userRelation // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adhaarNumber: adhaarNumber == freezed
          ? _value.adhaarNumber
          : adhaarNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberDetails implements _MemberDetails {
  _$_MemberDetails(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.name,
      @JsonKey(name: 'user_relation') required this.userRelation,
      @JsonKey(name: 'mobile_number') required this.mobileNumber,
      @JsonKey(name: 'adhar_number') required this.adhaarNumber});

  factory _$_MemberDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MemberDetailsFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String name;
  @override
  @JsonKey(name: 'user_relation')
  final String userRelation;
  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  @JsonKey(name: 'adhar_number')
  final String adhaarNumber;

  @override
  String toString() {
    return 'MemberDetails(userId: $userId, name: $name, userRelation: $userRelation, mobileNumber: $mobileNumber, adhaarNumber: $adhaarNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberDetails &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.userRelation, userRelation) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality()
                .equals(other.adhaarNumber, adhaarNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userRelation),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(adhaarNumber));

  @JsonKey(ignore: true)
  @override
  _$$_MemberDetailsCopyWith<_$_MemberDetails> get copyWith =>
      __$$_MemberDetailsCopyWithImpl<_$_MemberDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberDetailsToJson(
      this,
    );
  }
}

abstract class _MemberDetails implements MemberDetails {
  factory _MemberDetails(
          {@JsonKey(name: 'user_id') required final String userId,
          required final String name,
          @JsonKey(name: 'user_relation') required final String userRelation,
          @JsonKey(name: 'mobile_number') required final String mobileNumber,
          @JsonKey(name: 'adhar_number') required final String adhaarNumber}) =
      _$_MemberDetails;

  factory _MemberDetails.fromJson(Map<String, dynamic> json) =
      _$_MemberDetails.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get name;
  @override
  @JsonKey(name: 'user_relation')
  String get userRelation;
  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @override
  @JsonKey(name: 'adhar_number')
  String get adhaarNumber;
  @override
  @JsonKey(ignore: true)
  _$$_MemberDetailsCopyWith<_$_MemberDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
