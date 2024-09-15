import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/register_entity_model.dart';
import '../model/register_response_model/register_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<RegisterResponseModel> register(
          RegisterEntityModel registrationRequestEntity) async =>
      await _api.register(registrationRequestEntity);

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async =>
      await _api.login(loginEntityModel);
}
