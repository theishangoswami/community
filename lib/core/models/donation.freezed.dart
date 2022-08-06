// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return _Donation.fromJson(json);
}

/// @nodoc
mixin _$Donation {
  @JsonKey(name: 'user_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'donation_amount')
  String get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationCopyWith<Donation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationCopyWith<$Res> {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) then) =
      _$DonationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_name') String name,
      @JsonKey(name: 'donation_amount') String amount,
      String date});
}

/// @nodoc
class _$DonationCopyWithImpl<$Res> implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._value, this._then);

  final Donation _value;
  // ignore: unused_field
  final $Res Function(Donation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DonationCopyWith<$Res> implements $DonationCopyWith<$Res> {
  factory _$$_DonationCopyWith(
          _$_Donation value, $Res Function(_$_Donation) then) =
      __$$_DonationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_name') String name,
      @JsonKey(name: 'donation_amount') String amount,
      String date});
}

/// @nodoc
class __$$_DonationCopyWithImpl<$Res> extends _$DonationCopyWithImpl<$Res>
    implements _$$_DonationCopyWith<$Res> {
  __$$_DonationCopyWithImpl(
      _$_Donation _value, $Res Function(_$_Donation) _then)
      : super(_value, (v) => _then(v as _$_Donation));

  @override
  _$_Donation get _value => super._value as _$_Donation;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_Donation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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
class _$_Donation implements _Donation {
  _$_Donation(
      {@JsonKey(name: 'user_name') required this.name,
      @JsonKey(name: 'donation_amount') required this.amount,
      required this.date});

  factory _$_Donation.fromJson(Map<String, dynamic> json) =>
      _$$_DonationFromJson(json);

  @override
  @JsonKey(name: 'user_name')
  final String name;
  @override
  @JsonKey(name: 'donation_amount')
  final String amount;
  @override
  final String date;

  @override
  String toString() {
    return 'Donation(name: $name, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Donation &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_DonationCopyWith<_$_Donation> get copyWith =>
      __$$_DonationCopyWithImpl<_$_Donation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonationToJson(
      this,
    );
  }
}

abstract class _Donation implements Donation {
  factory _Donation(
      {@JsonKey(name: 'user_name') required final String name,
      @JsonKey(name: 'donation_amount') required final String amount,
      required final String date}) = _$_Donation;

  factory _Donation.fromJson(Map<String, dynamic> json) = _$_Donation.fromJson;

  @override
  @JsonKey(name: 'user_name')
  String get name;
  @override
  @JsonKey(name: 'donation_amount')
  String get amount;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_DonationCopyWith<_$_Donation> get copyWith =>
      throw _privateConstructorUsedError;
}
