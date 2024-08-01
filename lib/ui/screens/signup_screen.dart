import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import 'package:ninejahotel/ui/screens/dashboard.dart';
import 'package:ninejahotel/ui/widget/button_widget.dart';
import 'package:ninejahotel/ui/widget/text_form_widget.dart';
import 'package:ninejahotel/ui/widget/text_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 22.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              TextView(
                text: 'Create Account',
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20.w),
                decoration:
                    BoxDecoration(border: Border.all(color: AppColor.white)),
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
                      color: AppColor.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20.w),
                decoration:
                    BoxDecoration(border: Border.all(color: AppColor.white)),
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
                      color: AppColor.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(children: [
                const Expanded(child: Divider()),
                SizedBox(
                  width: 14.w,
                ),
                TextView(
                  text: 'OR',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
                SizedBox(
                  width: 14.w,
                ),
                const Expanded(child: Divider()),
              ]),
              SizedBox(
                height: 40.h,
              ),
              TextFormWidget(
                hint: 'First Name',
                hintColor: AppColor.white,
                label: 'Input Name',
                // labelColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'Last Name',
                hintColor: AppColor.white,
                label: 'Input Last Name',
                // labelColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'Telephone',
                hintColor: AppColor.white,
                label: 'Input Number',
                // labelColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'Email',
                hintColor: AppColor.white,
                label: 'Input Email',
                // labelColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'Referral Code',
                hintColor: AppColor.white,
                label: 'Input Code',
                // labelColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                hint: 'Password',
                hintColor: AppColor.white,
                label: 'Input Password',
                // labelColor: AppColor.white,
                suffixIcon: Icons.visibility_outlined,
                suffixIconColor: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormWidget(
                  hint: 'Confirm Password',
                  hintColor: AppColor.white,
                  label: 'Input Password',
                  // labelColor: AppColor.white,
                  suffixIcon: Icons.visibility_outlined,
                  suffixIconColor: AppColor.white),
              SizedBox(
                height: 50.h,
              ),
              ButtonWidget(
                buttonText: 'Sign Up',
                buttonColor: AppColor.primary,
                color: AppColor.white,
                buttonBorderColor: AppColor.transparent,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  const Dashboard())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
