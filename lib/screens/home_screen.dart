import 'package:doc2heal_admin/screens/doctors_list.dart';
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
        stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong!');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> doctorData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              // Inside your ListView.builder itemBuilder
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(doctorData['imagepath']),
                ), // Display the doctor's photo
                title: Text(doctorData['name']), // Display the doctor's name
                subtitle: Text(
                    doctorData['birthday']), // Display the doctor's birthday
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
