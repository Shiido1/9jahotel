// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/core/connect_end/model/register_entity_model.dart';
import 'package:ninejahotel/core/core_folder/app/app.router.dart';
import 'package:ninejahotel/main.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/widget/button_widget.dart';
import 'package:ninejahotel/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.locator.dart';
import '../app_asset/app_validation.dart';
import '../widget/text_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstnameController.text = '';
    lastnameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
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
                        text: 'Create Account',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormWidget(
                        hint: 'First Name',
                        hintColor: AppColor.white,
                        label: 'Input Name',
                        controller: firstnameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Last Name',
                        hintColor: AppColor.white,
                        label: 'Input Last Name',
                        controller: lastnameController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Telephone',
                        hintColor: AppColor.white,
                        label: 'Input Number',
                        controller: phoneController,
                        validator: AppValidator.validatePhone(),
                      ),
                      SizedBox(
                        height: 20.h,
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
                        height: 20.h,
                      ),
                      TextFormWidget(
                        hint: 'Confirm Password',
                        hintColor: AppColor.white,
                        label: 'Input Password',
                        suffixIconColor: AppColor.white,
                        controller: confirmPasswordController,
                        validator: AppValidator.confirmValidatePassword(
                            passwordController1: passwordController,
                            passwordController2: confirmPasswordController),
                        suffixIcon: !model.isTogglePasswordConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: !model.isTogglePasswordConfirm,
                        onPasswordToggle: model.isOnTogglePasswordConfirm,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: ()=>navigate.navigateTo(Routes.loginScreen),
                        child: TextView(
                          text: 'Already have an account? Login',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Sign Up',
                          buttonColor: AppColor.primary,
                          color: AppColor.white,
                          buttonBorderColor: AppColor.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.signUpUser(
                                  RegisterEntityModel(
                                      firstname: firstnameController.text,
                                      lastname: lastnameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          confirmPasswordController.text),
                                  context);
                            }
                          }),
                          SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
