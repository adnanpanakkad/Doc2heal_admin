import 'package:flutter/material.dart';
import 'package:doc2heal_admin/screens/doctors_list.dart';
import 'package:doc2heal_admin/services/firebase/firestore_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Doctors List'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: DoctorRepository().getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic>? doctorData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                tileColor: Colors.white, // Optional: Set a background color
                textColor: Colors.black, // Optional: Set text color
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(doctorData['doctorimg'] ?? ''),
                  backgroundColor: Colors
                      .grey[200], // Optional: Set background color for avatar
                ),
                title: Text(
                  doctorData['name'] ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  doctorData['specialization'] ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailsScreen(
                        doctorData: doctorData,
                        userId: doctorData['id'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
