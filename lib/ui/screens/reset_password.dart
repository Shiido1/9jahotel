import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.locator.dart';
import '../app_asset/app_color.dart';
import '../app_asset/app_validation.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    confirmPasswordController.text = '';
    passwordController.text = '';
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
                        text: 'Reset Password',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Password',
                        hintColor: AppColor.white,
                        label: 'Input Password',
                        controller: passwordController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Confirm Password',
                        hintColor: AppColor.white,
                        label: 'Input Password',
                        suffixIcon: Icons.visibility_outlined,
                        suffixIconColor: AppColor.white,
                        controller: confirmPasswordController,
                        validator: AppValidator.confirmValidatePassword(
                            passwordController1: passwordController,
                            passwordController2: confirmPasswordController),
                        // suffixIcon: !model.isTogglePassword
                        //     ? Icons.visibility_off_outlined
                        //     : Icons.visibility_outlined,
                        // obscureText: !model.isTogglePassword,
                        // onPasswordToggle: model.isOnTogglePassword,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Reset Password',
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
