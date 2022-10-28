import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutter/data/providers/service_providers.dart';

import '../data/repositories/database_repository.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService(ref));

class DatabaseService implements DatabaseRepository {
  DatabaseService(this._ref);

  final Ref _ref;

  @override
  Future<void> deleteDocument({String? documentId, String? collection}) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getDocument({String? documentId, String? collection}) async {
    try {
      final response = await _ref.read(databaseProvider).collection(collection!).doc(documentId!).get();
      final data = response.data();
      return data;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> save({Map<String, dynamic>? document, String? table}) async {
    try {
      await _ref.read(databaseProvider).collection(table!).doc(document!['id']).set(document);
      return '';
    } on FirebaseException catch (e) {
      return e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateDocument({String? docId, Map<String, dynamic>? data, String? table}) async {
    try {
      await _ref.read(databaseProvider).collection(table!).doc(docId).update(data!);
      return '';
    } on FirebaseException catch (e) {
      return e.code;
    } catch (e) {
      rethrow;
    }
  }
}
