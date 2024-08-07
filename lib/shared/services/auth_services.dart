import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection('users').doc(result.user!.uid).set({
        'email': email,
        'role': 'user', // Default role or based on your logic
      });
      return result.user;
    } catch (e) {
      print('Error registering: $e');
      return null;
    }
  }

  Future<void> assignRole(User user, String role) async {
    try {
      await _firestore.collection('users').doc(user.uid).update({'role': role});
    } catch (e) {
      print('Error assigning role: $e');
    }
  }

  Future<String?> getUserRole(User user) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user.uid).get();
      return doc['role'];
    } catch (e) {
      print('Error getting user role: $e');
      return null;
    }
  }
}
