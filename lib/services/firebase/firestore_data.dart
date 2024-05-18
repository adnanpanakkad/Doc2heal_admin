import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal_admin/screens/model/doctor_model.dart';

class DoctorRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveDoctorData(DoctorModel user, String id) async {
    try {
      await _db.collection("doctor").doc(id).set(user.toJson());
    } catch (e) {
      throw 'not saved';
    }
  }

  /// Function to fetch user data from Firestore by user ID
  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors() {
    return _db.collection("doctor").snapshots();
  }

  /// Function to delete user data from Firestore by user ID
  Future<void> deleteDoctorData(String id) async {
    try {
      await _db.collection("doctor").doc(id).delete();
    } catch (e) {
      throw 'not deleted';
    }
  }
}
