// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateDetail _$StateDetailFromJson(Map<String, dynamic> json) {
  return _StateDetail.fromJson(json);
}

/// @nodoc
mixin _$StateDetail {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  String? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_name')
  String get stateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateDetailCopyWith<StateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateDetailCopyWith<$Res> {
  factory $StateDetailCopyWith(
          StateDetail value, $Res Function(StateDetail) then) =
      _$StateDetailCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'country_id') String? countryId,
      @JsonKey(name: 'state_name') String stateName});
}

/// @nodoc
class _$StateDetailCopyWithImpl<$Res> implements $StateDetailCopyWith<$Res> {
  _$StateDetailCopyWithImpl(this._value, this._then);

  final StateDetail _value;
  // ignore: unused_field
  final $Res Function(StateDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? countryId = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: stateName == freezed
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StateDetailCopyWith<$Res>
    implements $StateDetailCopyWith<$Res> {
  factory _$$_StateDetailCopyWith(
          _$_StateDetail value, $Res Function(_$_StateDetail) then) =
      __$$_StateDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'country_id') String? countryId,
      @JsonKey(name: 'state_name') String stateName});
}

/// @nodoc
class __$$_StateDetailCopyWithImpl<$Res> extends _$StateDetailCopyWithImpl<$Res>
    implements _$$_StateDetailCopyWith<$Res> {
  __$$_StateDetailCopyWithImpl(
      _$_StateDetail _value, $Res Function(_$_StateDetail) _then)
      : super(_value, (v) => _then(v as _$_StateDetail));

  @override
  _$_StateDetail get _value => super._value as _$_StateDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? countryId = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$_StateDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: stateName == freezed
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateDetail implements _StateDetail {
  _$_StateDetail(
      {required this.id,
      @JsonKey(name: 'country_id') this.countryId,
      @JsonKey(name: 'state_name') required this.stateName});

  factory _$_StateDetail.fromJson(Map<String, dynamic> json) =>
      _$$_StateDetailFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'country_id')
  final String? countryId;
  @override
  @JsonKey(name: 'state_name')
  final String stateName;

  @override
  String toString() {
    return 'StateDetail(id: $id, countryId: $countryId, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateDetail &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.stateName, stateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(stateName));

  @JsonKey(ignore: true)
  @override
  _$$_StateDetailCopyWith<_$_StateDetail> get copyWith =>
      __$$_StateDetailCopyWithImpl<_$_StateDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateDetailToJson(
      this,
    );
  }
}

abstract class _StateDetail implements StateDetail {
  factory _StateDetail(
          {required final String id,
          @JsonKey(name: 'country_id') final String? countryId,
          @JsonKey(name: 'state_name') required final String stateName}) =
      _$_StateDetail;

  factory _StateDetail.fromJson(Map<String, dynamic> json) =
      _$_StateDetail.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'country_id')
  String? get countryId;
  @override
  @JsonKey(name: 'state_name')
  String get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_StateDetailCopyWith<_$_StateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
