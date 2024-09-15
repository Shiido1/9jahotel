import 'package:injectable/injectable.dart';
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/get_favorite_response_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../contract/favorite_contract_implementation.dart';
import '../model/favorite_response_model/favorite_response_model.dart';

@lazySingleton
class FavoriteRepoImpl {
  final _contract = locator<FavoriteContractsImpl>();

  Future<FavoriteResponseModel> addFavorite(String name) async {
    final response = await _contract.favorite(name);
    return response;
  }

  Future<GetFavoriteResponseModel> getFavorite() async {
    final response = await _contract.getFavorite();
    return response;
  }

}

