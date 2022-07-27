// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pincode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pincode _$PincodeFromJson(Map<String, dynamic> json) {
  return _Pincode.fromJson(json);
}

/// @nodoc
mixin _$Pincode {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  String get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pincode')
  String get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PincodeCopyWith<Pincode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PincodeCopyWith<$Res> {
  factory $PincodeCopyWith(Pincode value, $Res Function(Pincode) then) =
      _$PincodeCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'city_id') String cityId,
      @JsonKey(name: 'pincode') String pinCode});
}

/// @nodoc
class _$PincodeCopyWithImpl<$Res> implements $PincodeCopyWith<$Res> {
  _$PincodeCopyWithImpl(this._value, this._then);

  final Pincode _value;
  // ignore: unused_field
  final $Res Function(Pincode) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityId = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PincodeCopyWith<$Res> implements $PincodeCopyWith<$Res> {
  factory _$$_PincodeCopyWith(
          _$_Pincode value, $Res Function(_$_Pincode) then) =
      __$$_PincodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'city_id') String cityId,
      @JsonKey(name: 'pincode') String pinCode});
}

/// @nodoc
class __$$_PincodeCopyWithImpl<$Res> extends _$PincodeCopyWithImpl<$Res>
    implements _$$_PincodeCopyWith<$Res> {
  __$$_PincodeCopyWithImpl(_$_Pincode _value, $Res Function(_$_Pincode) _then)
      : super(_value, (v) => _then(v as _$_Pincode));

  @override
  _$_Pincode get _value => super._value as _$_Pincode;

  @override
  $Res call({
    Object? id = freezed,
    Object? cityId = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_$_Pincode(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: pinCode == freezed
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pincode implements _Pincode {
  _$_Pincode(
      {required this.id,
      @JsonKey(name: 'city_id') required this.cityId,
      @JsonKey(name: 'pincode') required this.pinCode});

  factory _$_Pincode.fromJson(Map<String, dynamic> json) =>
      _$$_PincodeFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'city_id')
  final String cityId;
  @override
  @JsonKey(name: 'pincode')
  final String pinCode;

  @override
  String toString() {
    return 'Pincode(id: $id, cityId: $cityId, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pincode &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cityId, cityId) &&
            const DeepCollectionEquality().equals(other.pinCode, pinCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cityId),
      const DeepCollectionEquality().hash(pinCode));

  @JsonKey(ignore: true)
  @override
  _$$_PincodeCopyWith<_$_Pincode> get copyWith =>
      __$$_PincodeCopyWithImpl<_$_Pincode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PincodeToJson(
      this,
    );
  }
}

abstract class _Pincode implements Pincode {
  factory _Pincode(
      {required final String id,
      @JsonKey(name: 'city_id') required final String cityId,
      @JsonKey(name: 'pincode') required final String pinCode}) = _$_Pincode;

  factory _Pincode.fromJson(Map<String, dynamic> json) = _$_Pincode.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'city_id')
  String get cityId;
  @override
  @JsonKey(name: 'pincode')
  String get pinCode;
  @override
  @JsonKey(ignore: true)
  _$$_PincodeCopyWith<_$_Pincode> get copyWith =>
      throw _privateConstructorUsedError;
}
