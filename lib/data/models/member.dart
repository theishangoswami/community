import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  final String? id;
  final String? uid;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? address;
  final String? gender;
  final String? caste;
  final String? aadharNumber;
  final String? password;
  final String? inviteCode;
  Member({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.mobileNumber,
    this.address,
    this.gender,
    this.caste,
    this.aadharNumber,
    this.password,
    this.inviteCode,
  });

  factory Member.fromDoc(QueryDocumentSnapshot data) {
    return Member(
      id: data.id,
      uid: data.get('uid'),
      name: data.get('name'),
      email: data.get('email'),
      mobileNumber: data.get('mobile_number'),
      address: data.get('address'),
      gender: data.get('gender'),
      caste: data.get('caste'),
      aadharNumber: data.get('aadhar_number'),
      password: data.get('password'),
      inviteCode: data.get('invite_code'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'mobile_number': mobileNumber,
      'address': address,
      'gender': gender,
      'caste': caste,
      'aadhar_number': aadharNumber,
      'password': password,
      'invite_code': inviteCode,
    };
  }
}
