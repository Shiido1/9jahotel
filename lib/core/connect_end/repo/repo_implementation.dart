import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_implementation.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/register_entity_model.dart';
import '../model/register_response_model/register_response_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<RegisterResponseModel> register(
      RegisterEntityModel registrationRequestEntity) async {
    final response = await _contract.register(registrationRequestEntity);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async {
    final response = await _contract.login(loginEntityModel);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

}
