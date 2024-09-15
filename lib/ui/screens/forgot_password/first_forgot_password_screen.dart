import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_asset/app_color.dart';
import '../../app_asset/app_validation.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';
import '../../widget/text_widget.dart';

class FirstForgotPasswordScreen extends StatefulWidget {
  const FirstForgotPasswordScreen({super.key});

  @override
  State<FirstForgotPasswordScreen> createState() =>
      _FirstForgotPasswordScreenState();
}

class _FirstForgotPasswordScreenState extends State<FirstForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.text = '';
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
                        text: 'Enter your email address and select Proceed.',
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Email Address',
                        hintColor: AppColor.white,
                        label: 'Input Email',
                        controller: email,
                        validator: AppValidator.validateString(),
                      ),
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
