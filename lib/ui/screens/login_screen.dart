import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/core/connect_end/model/login_entity_model.dart';
import 'package:ninejahotel/ui/widget/button_widget.dart';
import 'package:stacked/stacked.dart';

import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.locator.dart';
import '../app_asset/app_color.dart';
import '../app_asset/app_validation.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.text = '';
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
                        text: 'Welcome Back',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'Email',
                        hintColor: AppColor.white,
                        label: 'Input Email',
                        controller: emailController,
                        validator: AppValidator.validateEmail(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Password',
                        hintColor: AppColor.white,
                        label: 'Input Password',
                        suffixIconColor: AppColor.white,
                        controller: passwordController,
                        validator: AppValidator.validateString(),
                        suffixIcon: !model.isTogglePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: !model.isTogglePassword,
                        onPasswordToggle: model.isOnTogglePassword,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: TextView(
                            text: 'Forgot Password',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Login',
                          buttonColor: AppColor.primary,
                          color: AppColor.white,
                          buttonBorderColor: AppColor.transparent,
                          isLoading: model.isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.loginUser(
                                  LoginEntityModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      deviceName: Platform.isAndroid
                                          ? 'android'
                                          : 'ios'),
                                  context);
                            }
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
