import 'package:doc2heal_admin/widgets/constants/app_color.dart';
import 'package:doc2heal_admin/widgets/constants/custom_textstyle.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          text,
          style: CustomTextStyle.buttonTextStyle,
        ),
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Appcolor.primaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
