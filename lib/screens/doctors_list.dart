import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  const DoctorDetailsScreen({required this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorData['name'] ?? 'Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(doctorData['imagepath'] ?? ''),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text('Name: ${doctorData['name'] ?? ''}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Birthday: ${doctorData['birthday'] ?? ''}',
                style: TextStyle(fontSize: 16)),
            // Add more fields as necessary
          ],
        ),
      ),
    );
  }
}
