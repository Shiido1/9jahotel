
import 'package:injectable/injectable.dart';
import 'package:ninejahotel/core/api_folder/favorite_api.dart';
import 'package:ninejahotel/core/connect_end/model/favorite_response_model/favorite_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/get_favorite_response_model.dart';

import '../../core_folder/app/app.locator.dart';

@lazySingleton
class FavoriteContractsImpl {
  final _api = locator<FavoriteApi>();

  Future<FavoriteResponseModel> favorite(
          String hotel) async =>
      await _api.favorite(hotel);

  Future<GetFavoriteResponseModel> getFavorite() async =>
      await _api.getFavorite();
}