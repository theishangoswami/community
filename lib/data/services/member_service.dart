import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/member.dart';

class MemberService {
  final CollectionReference memberCollection =
      FirebaseFirestore.instance.collection('members');

  Future<void> createUser({
    required String name,
    required String uid,
    required String email,
    required String password,
    required String phoneNumber,
    required String address,
    required String gender,
    required String caste,
    required String aadharNumber,
    required String inviteCode,
    required BuildContext context,
  }) async {
    Member member = Member(
      uid: uid,
      name: name,
      email: email,
      password: password,
      mobileNumber: phoneNumber,
      address: address,
      gender: gender,
      caste: caste,
      aadharNumber: aadharNumber,
      inviteCode: inviteCode,
    );
    memberCollection
        .add(member.toMap())
        .then((value) => print("Added member to collection ✌️"));
    return;
  }

  Future<void> loginUser(String email, String password) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return;
  }
}
