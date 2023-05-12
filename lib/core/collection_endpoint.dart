import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CollectionEndpoints {
  static CollectionReference<Map<String, dynamic>> usersCollection =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference<Map<String, dynamic>> postCollection =
      FirebaseFirestore.instance.collection('posts');
}
