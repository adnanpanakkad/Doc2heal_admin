import 'package:doc2heal_admin/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profilescreen'),
      ),
      body: Center(
        child: IconButton.filled(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(Icons.logout)),
      ),
    );
  }
}
