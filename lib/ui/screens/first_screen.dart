import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/screens/dashboard.dart';
import 'package:ninejahotel/ui/screens/signup_screen.dart';
import 'package:ninejahotel/ui/service/google_auth_services.dart';

import '../../core/core_folder/manager/shared_preference.dart';
import '../app_asset/app_image.dart';
import '../widget/button_widget.dart';
import '../widget/text_widget.dart';

class FirstScreen extends StatelessWidget {
   FirstScreen({super.key});


final _session = SharedPreferencesService();

  signInWithFacebook(context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCrendantial =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    if (loginResult.status == LoginStatus.success) {
//       // you are logged
      final AccessToken accessToken = loginResult.accessToken!;
      print("result.status${loginResult.status}");
      print("result.message${loginResult.message}");
      print("result.accessToken$accessToken");
      print("result.accessToken${loginResult.toString()}");

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Dashboard()));

      _session.usersData = await FacebookAuth.instance.getUserData();
      _session.isLoggedIn = true;
      _session.isLoggedInFb = true;
    } else {
      print(loginResult.status);
      print(loginResult.message);
    }
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCrendantial);
//     final LoginResult result = await FacebookAuth.instance
//         .login(); // by default we request the email and the public profile
// // or FacebookAuth.i.login()
//
  }

  signInFB(context) async {
    print('..........');
    try {
      final UserCredential userCredential = await signInWithFacebook(context);
      print("userCredential.user::${userCredential.user.toString()}");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 22.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                AppImage.logo,
                width: 240.w,
                height: 100.h,
              ),
              SizedBox(
                height: 40.h,
              ),
              TextView(
                text: 'Create Account',
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primary,
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () => GoogleAuthServices().signInWithGoogle(context),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 114, 225, 225))),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImage.google,
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      TextView(
                        text: 'Proceed with Google',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () => signInFB(context),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 114, 225, 225))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.fb,
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      TextView(
                        text: 'Proceed with Facebook',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(children: [
                const Expanded(
                    child: Divider(color: Color.fromARGB(255, 114, 225, 225))),
                SizedBox(
                  width: 14.w,
                ),
                TextView(
                  text: 'OR',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary,
                ),
                SizedBox(
                  width: 14.w,
                ),
                const Expanded(
                    child: Divider(
                  color: Color.fromARGB(255, 114, 225, 225),
                )),
              ]),
              SizedBox(
                height: 40.h,
              ),
              ButtonWidget(
                buttonText: 'Sign Up',
                buttonColor: AppColor.primary,
                color: AppColor.white,
                buttonBorderColor: AppColor.transparent,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  const SignupScreen())),
              ),
              SizedBox(
                height: 20.h,
              ),
              ButtonWidget(
                buttonText: 'Continue as a Guest',
                buttonColor: AppColor.white,
                color: AppColor.primary,
                buttonBorderColor: AppColor.primary,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Dashboard())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
