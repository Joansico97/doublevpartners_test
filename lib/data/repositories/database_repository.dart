abstract class DatabaseRepository {
  Future<Map<String, dynamic>?> getDocument({
    String? documentId,
    String? collection,
  });
  Future<String> save({
    Map<String, dynamic>? document,
    String? table,
  });
  Future<String> updateDocument({
    String? docId,
    Map<String, dynamic>? data,
    String? table,
  });
  Future<void> deleteDocument({
    String? documentId,
    String? collection,
  });
}
