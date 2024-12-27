import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addJournalEntry({
    required String title,
    required String body,
  }) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      throw Exception("User is not logged in.");
    }

    final journalingEntry = <String, dynamic>{
      "userId": userId,
      "title": title,
      "body": body,
      "timestamp": Timestamp.now(),
    };

    try {
      DocumentReference docRef = await _db.collection("journaling").add(journalingEntry);
      print('DocumentSnapshot added with ID: ${docRef.id}');
    } catch (e) {
      print("Failed to add journal entry: $e");
      throw Exception("Error adding journal entry: $e");
    }
  }

  /// Mendapatkan stream data jurnal berdasarkan UID pengguna yang login
Stream<QuerySnapshot> getUserJournals() {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
     print("Fetching journals for user ID: $userId");
    if (userId == null) {
      throw Exception("User is not logged in.");
    }

    return _db
        .collection("journaling")
        .where("userId", isEqualTo: userId)
        .orderBy("timestamp", descending: true)
        .snapshots();
  }
}
