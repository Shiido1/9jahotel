import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../ui/app_asset/app_utils.dart';
import '../../../ui/screens/dashboard.dart';
import '../../../ui/screens/login_screen.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/register_entity_model.dart';
import '../model/register_response_model/register_response_model.dart';
import '../repo/repo_implementation.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  RegisterResponseModel? get registrationResponse => _registrationResponse;
  RegisterResponseModel? _registrationResponse;

  LoginResponseModel? get loginResponse => _loginResponse;
  LoginResponseModel? _loginResponse;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  bool isOnTogglePasswordConfirm() {
    _isTogglePasswordConfirm = !_isTogglePasswordConfirm;
    notifyListeners();
    return _isTogglePasswordConfirm;
  }

  Future<void> signUpUser(RegisterEntityModel registerEntity, contxt) async {
    try {
      _isLoading = true;
      _registrationResponse = await runBusyFuture(
          repositoryImply.register(registerEntity),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _registrationResponse?.message!.toString());
      if (_registrationResponse?.success == true) {
        Get.to(() => const LoginScreen(),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  // login flow so api call for method can be called here

  Future<void> loginUser(LoginEntityModel loginEntity, contxt) async {
    try {
      _isLoading = true;
      _loginResponse = await runBusyFuture(repositoryImply.login(loginEntity),
          throwException: true);

      if (_loginResponse?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _loginResponse?.message!.toString());
        Get.to(() => const Dashboard(),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
