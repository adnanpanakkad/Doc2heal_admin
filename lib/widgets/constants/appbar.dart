// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:doc2heal_admin/screens/bottombar_screen.dart';
import 'package:doc2heal_admin/widgets/constants/app_color.dart';
import 'package:flutter/material.dart';

class DeatialAppbar extends StatelessWidget {
  const DeatialAppbar({super.key, required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        //style: GoogleFonts.urbanist(color: Colors.black),
      ),
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 11, top: 12, bottom: 12),
        child: Container(
          decoration: BoxDecoration(
              color: Appcolor.primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BottomBarScreen()));
              },
              icon: const Icon(Icons.arrow_back)),
        ),
      ),
    );
  }
}
