import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/register_entity_model.dart';
import '../connect_end/model/register_response_model/register_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<RegisterResponseModel> register(
      RegisterEntityModel signUpEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.register, RequestMethod.post,
          data: FormData.fromMap(signUpEntity.toJson()));
      logger.d(response.data);
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(UrlConfig.login, RequestMethod.post,
          data: FormData.fromMap(loginEntity.toJson()));
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
