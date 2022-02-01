import 'dart:developer';

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/models/user_model.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import 'local_storage_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = locator<FirebaseService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _populateCurrentUser(authResult.user);
      return authResult.user;
    } on FirebaseAuthException catch (e) {
      await locator<DialogService>().showDialog(title: e.message.toString());
      log(e.message.toString());
      return null;
    }
  }

  Future<bool> signUpWithEmail({
    required UserModel user,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      _currentUser = UserModel(
        id: authResult.user!.uid,
        name: user.name,
        phone: user.phone,
        email: user.email,
        role: user.role,
      );

      //Create new user document using FireStoreService
      await _firebaseService.createUser(_currentUser!);

      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      await locator<DialogService>().showDialog(title: e.message.toString());
      log(e.message.toString());
      return false;
    }
  }

  Stream<User?> get userState => _firebaseAuth.authStateChanges();

  Future<bool> checkUserLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future userLogout() async {
    await _firebaseAuth.signOut();
  }

  Future _populateCurrentUser(User? user) async {
    if (user != null) {
      _currentUser = await _firebaseService.getUserProfile(user.uid);
      _localStorageService.setter("uid", _currentUser!.id!);
    }
  }

  Future refreshUser(String userId) async {
    _currentUser = await _firebaseService.getUserProfile(userId);
  }
}
