// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  @JsonKey(name: 'vender_name')
  String get vendorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_amount')
  String get expenseAmount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'vender_name') String vendorName,
      @JsonKey(name: 'expense_amount') String expenseAmount,
      String date});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res> implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  final Expense _value;
  // ignore: unused_field
  final $Res Function(Expense) _then;

  @override
  $Res call({
    Object? vendorName = freezed,
    Object? expenseAmount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      vendorName: vendorName == freezed
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      expenseAmount: expenseAmount == freezed
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$_ExpenseCopyWith(
          _$_Expense value, $Res Function(_$_Expense) then) =
      __$$_ExpenseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'vender_name') String vendorName,
      @JsonKey(name: 'expense_amount') String expenseAmount,
      String date});
}

/// @nodoc
class __$$_ExpenseCopyWithImpl<$Res> extends _$ExpenseCopyWithImpl<$Res>
    implements _$$_ExpenseCopyWith<$Res> {
  __$$_ExpenseCopyWithImpl(_$_Expense _value, $Res Function(_$_Expense) _then)
      : super(_value, (v) => _then(v as _$_Expense));

  @override
  _$_Expense get _value => super._value as _$_Expense;

  @override
  $Res call({
    Object? vendorName = freezed,
    Object? expenseAmount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_Expense(
      vendorName: vendorName == freezed
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      expenseAmount: expenseAmount == freezed
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
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
class _$_Expense implements _Expense {
  _$_Expense(
      {@JsonKey(name: 'vender_name') required this.vendorName,
      @JsonKey(name: 'expense_amount') required this.expenseAmount,
      required this.date});

  factory _$_Expense.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseFromJson(json);

  @override
  @JsonKey(name: 'vender_name')
  final String vendorName;
  @override
  @JsonKey(name: 'expense_amount')
  final String expenseAmount;
  @override
  final String date;

  @override
  String toString() {
    return 'Expense(vendorName: $vendorName, expenseAmount: $expenseAmount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Expense &&
            const DeepCollectionEquality()
                .equals(other.vendorName, vendorName) &&
            const DeepCollectionEquality()
                .equals(other.expenseAmount, expenseAmount) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vendorName),
      const DeepCollectionEquality().hash(expenseAmount),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      __$$_ExpenseCopyWithImpl<_$_Expense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseToJson(
      this,
    );
  }
}

abstract class _Expense implements Expense {
  factory _Expense(
      {@JsonKey(name: 'vender_name') required final String vendorName,
      @JsonKey(name: 'expense_amount') required final String expenseAmount,
      required final String date}) = _$_Expense;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$_Expense.fromJson;

  @override
  @JsonKey(name: 'vender_name')
  String get vendorName;
  @override
  @JsonKey(name: 'expense_amount')
  String get expenseAmount;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
