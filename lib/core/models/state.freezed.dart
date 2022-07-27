// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

State _$StateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
mixin _$State {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_name')
  String get stateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCopyWith<State> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<$Res> {
  factory $StateCopyWith(State value, $Res Function(State) then) =
      _$StateCopyWithImpl<$Res>;
  $Res call({String id, @JsonKey(name: 'state_name') String stateName});
}

/// @nodoc
class _$StateCopyWithImpl<$Res> implements $StateCopyWith<$Res> {
  _$StateCopyWithImpl(this._value, this._then);

  final State _value;
  // ignore: unused_field
  final $Res Function(State) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: stateName == freezed
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StateCopyWith<$Res> implements $StateCopyWith<$Res> {
  factory _$$_StateCopyWith(_$_State value, $Res Function(_$_State) then) =
      __$$_StateCopyWithImpl<$Res>;
  @override
  $Res call({String id, @JsonKey(name: 'state_name') String stateName});
}

/// @nodoc
class __$$_StateCopyWithImpl<$Res> extends _$StateCopyWithImpl<$Res>
    implements _$$_StateCopyWith<$Res> {
  __$$_StateCopyWithImpl(_$_State _value, $Res Function(_$_State) _then)
      : super(_value, (v) => _then(v as _$_State));

  @override
  _$_State get _value => super._value as _$_State;

  @override
  $Res call({
    Object? id = freezed,
    Object? stateName = freezed,
  }) {
    return _then(_$_State(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: stateName == freezed
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_State implements _State {
  _$_State(
      {required this.id, @JsonKey(name: 'state_name') required this.stateName});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$$_StateFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'state_name')
  final String stateName;

  @override
  String toString() {
    return 'State(id: $id, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_State &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.stateName, stateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(stateName));

  @JsonKey(ignore: true)
  @override
  _$$_StateCopyWith<_$_State> get copyWith =>
      __$$_StateCopyWithImpl<_$_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateToJson(
      this,
    );
  }
}

abstract class _State implements State {
  factory _State(
      {required final String id,
      @JsonKey(name: 'state_name') required final String stateName}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'state_name')
  String get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_StateCopyWith<_$_State> get copyWith =>
      throw _privateConstructorUsedError;
}
