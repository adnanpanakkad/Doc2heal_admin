import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal_admin/screens/model/doctor_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DoctorRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveDoctorData(
      DoctorModel doctor, String id, File imageFile) async {
    try {
      // Upload the image and get the URL
      String imageUrl = await getImageUrl(imageFile);

      // Include the image URL in the doctor model
      doctor.imagepath = imageUrl;
      await _db.collection("doctor").doc(id).set(doctor.toJson());
    } catch (e) {
      throw 'not saved';
    }
  }

  /// Function to fetch user data from Firestore by user ID
  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors() {
    return _db.collection("doctor").snapshots();
  }

  /// Function to delete user data from Firestore by user ID
  Future<void> deleteDoctorData(String userId) async {
    try {
      await _db.collection("doctor").doc(userId).delete();
    } catch (e) {
      throw 'not deleted';
    }
  }

  Future<String> getImageUrl(File imageFile) async {
    String uniqueName = DateTime.now().millisecond.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('userimages/$uniqueName');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    final String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
