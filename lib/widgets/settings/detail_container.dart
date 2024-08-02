import 'package:doc2heal_admin/widgets/constants/app_color.dart';
import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Appcolor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Name', // Placeholder text
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // const SizedBox(height: 5),
                // Text(
                //   'Email Address', // Placeholder text
                //   style: const TextStyle(
                //     fontSize: 13,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(height: 5),
                // Text(
                //   'Phone Number', // Placeholder text
                //   style: const TextStyle(
                //     fontSize: 16,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
