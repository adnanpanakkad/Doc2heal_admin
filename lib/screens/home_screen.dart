import 'package:doc2heal_admin/screens/doctors_list.dart';
import 'package:doc2heal_admin/services/firebase/firestore_data.dart';
import 'package:flutter/material.dart';
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
            return Center(child: Text('Something went wrong!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> doctorData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(doctorData['imagepath'] ??
                      ''), // Ensure image path is valid
                ),
                title: Text(doctorData['name'] ?? ''), // Ensure name is valid
                subtitle: Text(
                    doctorData['birthday'] ?? ''), // Ensure birthday is valid
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DoctorDetailsScreen(doctorData: doctorData),
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
