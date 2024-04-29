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
  Future<DoctorModel> getDoctorById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection("doctor").doc(userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        return DoctorModel.fromJson(userData);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw 'not found data';
    }
  }

  /// Function to delete user data from Firestore by user ID
  Future<void> deleteDoctorData(String userId) async {
    try {
      await _db.collection("doctor").doc(userId).delete();
    } catch (e) {
      throw 'not deleted';
    }
  }
}
