// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$$_ExpenseFromJson(Map<String, dynamic> json) => _$_Expense(
      vendorName: json['vender_name'] as String,
      expenseAmount: json['expense_amount'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'vender_name': instance.vendorName,
      'expense_amount': instance.expenseAmount,
      'date': instance.date,
    };
