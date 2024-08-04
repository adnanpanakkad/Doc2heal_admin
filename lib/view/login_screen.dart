import 'package:doc2heal_admin/view/bottombar_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
                          image: AssetImage('assets/Mobile login-bro.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Text(
                          "Login to your\nAdmin",
                          textAlign: TextAlign
                              .center, // Center the text within the Text widget
                          style: CustomTextStyle.ultraBoldTextstyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    AuthButton(
                      text: 'Sign in with Google',
                      onTap: () async {
                        await AuthenticationRepository.googleSignIn();
                        print('SIGIN IN GOOGLE ok');
                        // Once sign-in is successful, navigate to BottombarScreen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const BottomBarScreen(),
                          ),
                        );
                      },
                      imagpath: 'assets/2702602.png',
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
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
                        secondTxt: "Terms and Policy",
                      ),
                    ),
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
