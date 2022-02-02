import 'dart:convert';
import 'dart:developer';

import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future updateUser(
    UserModel user,
  ) async {
    try {
      await _usersCollectionReference.doc(user.id).set(
            user.toJson(),
            SetOptions(merge: true),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel?> getUserProfile(String uid) async {
    try {
      final userData = await _usersCollectionReference.doc(uid).get();
      return UserModel.fromJson(
        userData.data()! as Map<String, dynamic>,
        userData.id,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(
            user.toJson(),
          );
    } catch (e) {
      return e.toString();
    }
  }
}
