// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gotra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gotra _$GotraFromJson(Map<String, dynamic> json) {
  return _Gotra.fromJson(json);
}

/// @nodoc
mixin _$Gotra {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'gotra_name')
  String get gotraName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GotraCopyWith<Gotra> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GotraCopyWith<$Res> {
  factory $GotraCopyWith(Gotra value, $Res Function(Gotra) then) =
      _$GotraCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'gotra_name') String gotraName});
}

/// @nodoc
class _$GotraCopyWithImpl<$Res> implements $GotraCopyWith<$Res> {
  _$GotraCopyWithImpl(this._value, this._then);

  final Gotra _value;
  // ignore: unused_field
  final $Res Function(Gotra) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? gotraName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gotraName: gotraName == freezed
          ? _value.gotraName
          : gotraName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GotraCopyWith<$Res> implements $GotraCopyWith<$Res> {
  factory _$$_GotraCopyWith(_$_Gotra value, $Res Function(_$_Gotra) then) =
      __$$_GotraCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'gotra_name') String gotraName});
}

/// @nodoc
class __$$_GotraCopyWithImpl<$Res> extends _$GotraCopyWithImpl<$Res>
    implements _$$_GotraCopyWith<$Res> {
  __$$_GotraCopyWithImpl(_$_Gotra _value, $Res Function(_$_Gotra) _then)
      : super(_value, (v) => _then(v as _$_Gotra));

  @override
  _$_Gotra get _value => super._value as _$_Gotra;

  @override
  $Res call({
    Object? id = freezed,
    Object? gotraName = freezed,
  }) {
    return _then(_$_Gotra(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gotraName: gotraName == freezed
          ? _value.gotraName
          : gotraName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gotra implements _Gotra {
  _$_Gotra(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'gotra_name') required this.gotraName});

  factory _$_Gotra.fromJson(Map<String, dynamic> json) =>
      _$$_GotraFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'gotra_name')
  final String gotraName;

  @override
  String toString() {
    return 'Gotra(id: $id, gotraName: $gotraName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gotra &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.gotraName, gotraName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(gotraName));

  @JsonKey(ignore: true)
  @override
  _$$_GotraCopyWith<_$_Gotra> get copyWith =>
      __$$_GotraCopyWithImpl<_$_Gotra>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GotraToJson(
      this,
    );
  }
}

abstract class _Gotra implements Gotra {
  factory _Gotra(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'gotra_name') required final String gotraName}) = _$_Gotra;

  factory _Gotra.fromJson(Map<String, dynamic> json) = _$_Gotra.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'gotra_name')
  String get gotraName;
  @override
  @JsonKey(ignore: true)
  _$$_GotraCopyWith<_$_Gotra> get copyWith =>
      throw _privateConstructorUsedError;
}
