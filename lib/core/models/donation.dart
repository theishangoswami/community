import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

@freezed
class Donation with _$Donation {
  factory Donation({
    @JsonKey(name: 'user_name') required String name,
    @JsonKey(name: 'donation_amount') required String amount,
    required String date,
  }) = _Donation;
  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);
}
