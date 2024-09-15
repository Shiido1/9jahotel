import 'package:flutter/cupertino.dart';
import 'package:ninejahotel/core/connect_end/model/favorite_response_model/favorite_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/datum.dart'
    as f;
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/get_favorite_response_model.dart';
import 'package:ninejahotel/core/connect_end/repo/favorite_repo_implementation.dart';
import 'package:ninejahotel/core/core_folder/app/app.logger.dart';
import 'package:stacked/stacked.dart';

import '../../../ui/app_asset/app_utils.dart';

class FavoritesViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('FavoriteViewModel');

  final repositoryImply = FavoriteRepoImpl();
  FavoritesViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  GetFavoriteResponseModel? _getFavoriteResponseModel;
  GetFavoriteResponseModel? get getFavoriteResponseModel =>
      _getFavoriteResponseModel;

  FavoriteResponseModel? _favoriteResponseModel;
  FavoriteResponseModel? get favoriteResponseModel => _favoriteResponseModel;
  List<f.Datum>? _favoriteResponseModelList = [];
  List<f.Datum>? get favoriteResponseModelList => _favoriteResponseModelList;
  List<f.Datum>? _favoriteResponseModelListCopy = [];

  int pg = 1;

  bool isLoadNoMore = false;

  Future<void> addFavorite(name, context) async {
    try {
      _isLoading = true;
      _favoriteResponseModel = await runBusyFuture(
          repositoryImply.addFavorite(name),
          throwException: true);
      _isLoading = false;

      AppUtils.snackbar(context,
          message: _favoriteResponseModel?.message, error: true);
    } catch (e) {
      _isLoading = false;
      logger.d(e);

      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getFavorite() async {
    try {
      _isLoading = true;
      _getFavoriteResponseModel = await runBusyFuture(
          repositoryImply.getFavorite(),
          throwException: true);
      _favoriteResponseModelList = _getFavoriteResponseModel!.data;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_getFavoriteResponseModel!.data!.length <
        _getFavoriteResponseModel!.meta!.total!) {
      pg++;
      try {
        _getFavoriteResponseModel =
            await runBusyFuture(repositoryImply.getFavorite());
        _favoriteResponseModelListCopy!
            .addAll(_getFavoriteResponseModel!.data!);
        _favoriteResponseModelList!.addAll(_favoriteResponseModelListCopy!);
        _favoriteResponseModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    notifyListeners();
  }
}
