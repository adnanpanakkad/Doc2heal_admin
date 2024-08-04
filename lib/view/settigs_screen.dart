import 'package:doc2heal_admin/view/help_suppport.dart';
import 'package:doc2heal_admin/view/login_screen.dart';
import 'package:doc2heal_admin/view/privacy_policy.dart';
import 'package:doc2heal_admin/view/terms_conditions.dart';
import 'package:doc2heal_admin/widgets/constants/custom_popup.dart';
import 'package:doc2heal_admin/widgets/constants/custom_textstyle.dart';
import 'package:doc2heal_admin/widgets/settings/detail_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettigsScreen extends StatelessWidget {
  const SettigsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Settings',
                  style: CustomTextStyle.highboldTxtStyle,
                ),
                DetailContainer(),
                SizedBox(height: 20),
                const Text('General', style: CustomTextStyle.buttonTextStyle),
                SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.admin_panel_settings_outlined,
                      color: Colors.purple),
                  title: Text('Terms & Conditions'),
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditionsScreen())),
                ),
                ListTile(
                  leading: const Icon(Icons.assignment_outlined,
                      color: Colors.amber),
                  title: Text('Privacy Policy'),
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen())),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.blue),
                  title: Text('Help & Support'),
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => HelpandSupport())),
                ),
                const SizedBox(height: 30),
                const Text('Account', style: CustomTextStyle.buttonTextStyle),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout',
                      style: TextStyle(color: Colors.black)),
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopup(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
