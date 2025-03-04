import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference membersCollection =
      FirebaseFirestore.instance.collection('members');

  Future<List<Map<String, dynamic>>> getMembers() async {
    try {
      QuerySnapshot snapshot = await membersCollection.get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching members: $e");
      return [];
    }
  }
}
