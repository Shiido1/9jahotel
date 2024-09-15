import 'package:injectable/injectable.dart';
import 'package:ninejahotel/core/connect_end/model/favorite_response_model/favorite_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/get_favorite_response_model.dart';

import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class FavoriteApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('FavoriteViewModel');

  Future<FavoriteResponseModel> favorite(String name) async {
    try {
      final response = await _service.call(
        "${UrlConfig.favorite}/$name",
        RequestMethod.post,
      );
      logger.d(response.data);
      return FavoriteResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetFavoriteResponseModel> getFavorite() async {
    try {
      final response = await _service.call(
        UrlConfig.favorite,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetFavoriteResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
