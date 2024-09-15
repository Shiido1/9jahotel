import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_asset/app_color.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

class SecondForgotPasswordScreen extends StatefulWidget {
  const SecondForgotPasswordScreen({super.key});

  @override
  State<SecondForgotPasswordScreen> createState() =>
      _SecondForgotPasswordScreenState();
}

class _SecondForgotPasswordScreenState
    extends State<SecondForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();

  @override
  void dispose() {
    otp.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 22.w),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      TextView(
                        text: 'Forgot your password',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextView(
                        text: 'Confirm the code we sent over SMS to.',
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextView(
                        text: 'Johndoe@gmail.com',
                        fontSize: 14.8.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // TextFormWidget(
                      //   hint: 'Email Address',
                      //   hintColor: AppColor.white,
                      //   label: 'Input Email',
                      //   controller: email,
                      //   validator: AppValidator.validateString(),
                      // ),

                      SizedBox(
                        height: 50.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Proceed',
                          buttonColor: AppColor.primary,
                          color: AppColor.white,
                          buttonBorderColor: AppColor.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
