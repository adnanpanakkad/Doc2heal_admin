import 'package:doc2heal_admin/screens/bottombar_screen.dart';
import 'package:doc2heal_admin/services/firebase/firestore_data.dart';
import 'package:doc2heal_admin/widgets/constants/appbar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  const DoctorDetailsScreen({Key? key, required this.doctorData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 70),
          child: DeatialAppbar(text: 'doctor Details')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  child: Image.network(doctorData['imagepath']),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Name'),
                    subtitle: Text(doctorData['name']),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Birthday'),
                    subtitle: Text(doctorData['birthday']),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Email'),
                    subtitle: Text(doctorData['email']),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Gender'),
                    subtitle: Text(doctorData['gender']),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Phone'),
                    subtitle: Text(doctorData['phone']),
                  ),
                ),
                Container(
                    height: 150,
                    width: 200,
                    child: Image.network(doctorData['expcerft'])),
                // Add more cards as needed for additional details
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    DoctorRepository().deleteDoctorData('0');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('rejected'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomBarScreen()));
                  },
                  child: const Text('Reject'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle approve action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Approved'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text('Approve'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
