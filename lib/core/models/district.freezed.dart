// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  String get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  String get districtName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'state_id') String stateId,
      @JsonKey(name: 'district') String districtName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res> implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  final District _value;
  // ignore: unused_field
  final $Res Function(District) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? stateId = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DistrictCopyWith<$Res> implements $DistrictCopyWith<$Res> {
  factory _$$_DistrictCopyWith(
          _$_District value, $Res Function(_$_District) then) =
      __$$_DistrictCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'state_id') String stateId,
      @JsonKey(name: 'district') String districtName});
}

/// @nodoc
class __$$_DistrictCopyWithImpl<$Res> extends _$DistrictCopyWithImpl<$Res>
    implements _$$_DistrictCopyWith<$Res> {
  __$$_DistrictCopyWithImpl(
      _$_District _value, $Res Function(_$_District) _then)
      : super(_value, (v) => _then(v as _$_District));

  @override
  _$_District get _value => super._value as _$_District;

  @override
  $Res call({
    Object? id = freezed,
    Object? stateId = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_$_District(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_District implements _District {
  _$_District(
      {required this.id,
      @JsonKey(name: 'state_id') required this.stateId,
      @JsonKey(name: 'district') required this.districtName});

  factory _$_District.fromJson(Map<String, dynamic> json) =>
      _$$_DistrictFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'state_id')
  final String stateId;
  @override
  @JsonKey(name: 'district')
  final String districtName;

  @override
  String toString() {
    return 'District(id: $id, stateId: $stateId, districtName: $districtName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_District &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.stateId, stateId) &&
            const DeepCollectionEquality()
                .equals(other.districtName, districtName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(stateId),
      const DeepCollectionEquality().hash(districtName));

  @JsonKey(ignore: true)
  @override
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      __$$_DistrictCopyWithImpl<_$_District>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistrictToJson(
      this,
    );
  }
}

abstract class _District implements District {
  factory _District(
          {required final String id,
          @JsonKey(name: 'state_id') required final String stateId,
          @JsonKey(name: 'district') required final String districtName}) =
      _$_District;

  factory _District.fromJson(Map<String, dynamic> json) = _$_District.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'state_id')
  String get stateId;
  @override
  @JsonKey(name: 'district')
  String get districtName;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      throw _privateConstructorUsedError;
}
