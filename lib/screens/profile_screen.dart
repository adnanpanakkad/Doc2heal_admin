import 'package:doc2heal_admin/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text('About'),
              onTap: () {
                // Handle tap on About
                print('Tapped on About');
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle tap on Privacy Policy
                print('Tapped on Privacy Policy');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
