import 'package:doc2heal_admin/screens/bottombar_screen.dart';
import 'package:doc2heal_admin/screens/home_screen.dart';
import 'package:doc2heal_admin/services/firebase/firebase_auth.dart';
import 'package:doc2heal_admin/widgets/auth_button.dart';
import 'package:doc2heal_admin/widgets/constants/custom_textstyle.dart';
import 'package:doc2heal_admin/widgets/constants/rich_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/Mobile login-bro.png'))),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Text(
                            "Login to your\nAdmin",
                            style: CustomTextStyle.ultraBoldTextstyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    AuthButton(
                        text: 'Sign in with Google',
                        onTap: () async {
                          // Perform Google sign-in
                          await AuthenticationRepository.googleSignIn();
                          print('SIGIN IN GOOGLE ok');
                          // Once sign-in is successful, navigate to BottombarScreen
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const BottomBarScreen(),
                            ),
                          );
                        },
                        imagpath: 'assets/2702602.png'),
                    const SizedBox(height: 20),
                    const Text('OR'),
                    const SizedBox(height: 20),
                    AuthButton(
                        text: 'Sigin with mobile',
                        onTap: () async {},
                        imagpath: 'assets/smartphone-call_15874.png'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: richText(
                          context: context,
                          firstTxt: "By entering to app, you agree to our\n",
                          secondTxt: "Terms and Policy"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
