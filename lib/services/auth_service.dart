import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prueba_flutter/data/models/remote_models/user_model/user_model.dart';
import 'package:prueba_flutter/data/providers/general_providers.dart';
import 'package:prueba_flutter/services/database_service.dart';

import '../data/providers/service_providers.dart';
import '../data/repositories/auth_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

class AuthService implements AuthBaseRepository {
  AuthService(this._ref);

  final Ref _ref;

  @override

  /// It logs in a user and updates the userLoggedProvider with the user's data
  ///
  /// Args:
  ///   email (String): email.trim(),
  ///   password (String): String
  ///
  /// Returns:
  ///   A Future<String>
  Future<String> logIn({required String email, required String password}) async {
    try {
      final response = await _ref.read(authProvider).signInWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );
      final data =
          await _ref.read(databaseServiceProvider).getDocument(documentId: response.user!.uid, collection: 'Users');

      if (data != null) {
        _ref.watch(userLoggedProvider.state).update((state) => UserModel.fromJson(data));
      }
      return '';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendPasswordReset({required String email}) {
    // TODO: implement sendPasswordReset
    throw UnimplementedError();
  }

  @override

  /// It signs out the user and updates the userLoggedProvider.state with an empty UserModel.
  Future<void> signOut() async {
    await _ref.read(authProvider).signOut();
    _ref.watch(userLoggedProvider.state).update(
          (state) => UserModel.fromJson({}),
        );
  }

  @override
  Future<String> signUp({required String email, required String password}) async {
    try {
      await _ref.read(authProvider).createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

      return '';
    } on FirebaseAuthException catch (e) {
      // TODO: show some dialog?
      return e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String? getCurrentUser() {
    return _ref.read(authProvider).currentUser?.uid;
  }
}
