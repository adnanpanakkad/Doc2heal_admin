import 'package:doc2heal_admin/services/firebase/firestore_data.dart';
import 'package:doc2heal_admin/widgets/constants/appbar.dart';
import 'package:doc2heal_admin/widgets/doclist.dart/build_row.dart';
import 'package:doc2heal_admin/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? doctorData;
  final String? userId; // Add userId parameter

  const DoctorDetailsScreen({
    super.key,
    required this.doctorData,
    required this.userId, // Add userId parameter
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DeatialAppbar(
          text: 'Doctor Details',
          onTap: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(doctorData!['doctorimg'] ?? ''),
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 600, // Adjust the max width as needed
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowTile('Name', 'Dr. ${doctorData!['name']}'),
                            rowTile('Birthday', doctorData!['birthday']),
                            rowTile('Phone', doctorData!['phone']),
                            rowTile('Gender', doctorData!['gender']),
                            rowTile('Specialization',
                                doctorData!['specialization']),
                            rowTile('Email', doctorData!['email']),
                            rowTile('Fees', doctorData!['fees']),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                doctorData!['expcerft'] ??
                                    'assets/Mobile login-bro.png',
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Wrap(
                    spacing: 20, // Adjust the spacing between buttons as needed
                    alignment:
                        WrapAlignment.center, // Align buttons to the center
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            Snacbar.customSnack(
                                'Rejected', context, Colors.red);
                            Navigator.pop(context);
                            await DoctorRepository()
                                .deleteDoctorData(doctorData!['uid']);
                          } catch (e) {
                            // Display error message to the user
                            Snacbar.customSnack(
                                'Error: $e', context, Colors.red);
                          }
                        },
                        icon: const Icon(Icons.cancel),
                        label: const Text('Reject'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Snacbar.customSnack(
                              'Approved', context, Colors.green);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Approve'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
