import 'dart:developer';

import 'package:doc2heal_admin/bottombar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationRepository {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? currentUser = FirebaseAuth.instance.currentUser;


  static Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      log("${user?.displayName}");
    } catch (e) {
      log('Google Sign-In Error: $e');
      throw Exception('Google Sign-In Error: $e');
    }
  }

//  static Future<void> getOtp(context, phoneNumberCon) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         verificationCompleted: (PhoneAuthCredential credential) {},
//         verificationFailed: (FirebaseAuthException ex) {},
//         codeSent: (String verificationId, int? resendtoken) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => OtpScreen(
//                         verificationId: verificationId,
//                       )));
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//         phoneNumber: phoneNumberCon);
//   }

//  static Future<PhoneAuthCredential?> verifyOtp(String otp, context) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationid!, smsCode: otp);

//       await _auth.signInWithCredential(credential);
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BottombarScreen(),
//           ),
//           (route) => false);
//       //snack bar
//     } catch (e) {
//       log("verify otp error $e");
//       return null;
//     }
//     return null;
//   }
}