import 'package:flutter/material.dart';
import 'package:ninejahotel/core/connect_end/model/available_rooms_response_model/available_rooms_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/cities_response_model/cities_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_hotel_categories_response_model/get_hotel_categories_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/room_image_response_model/room_image_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_entity_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_response_model/searched_hotels_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/view_hotel_response_model/view_hotel_response_model.dart';
import 'package:ninejahotel/core/connect_end/repo/booking_repo_implementation.dart';
import 'package:ninejahotel/core/core_folder/app/app.logger.dart';
import 'package:ninejahotel/ui/app_asset/app_utils.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/screens/hotel/hotel_room_category.dart';
import '../model/cities_response_model/datum.dart' as ci;
import '../model/searched_hotels_response_model/datum.dart' as se;

class BookingsViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('BookingViewModel');

  final repositoryImply = BookingRepoImpl();

  BookingsViewModel({this.context});

  bool get isLoadingCity => _isLoadingCity;
  bool _isLoadingCity = false;
  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingSearchHotels => _isLoadingSearchHotels;
  bool _isLoadingSearchHotels = false;

  CitiesResponseModel? _citiesResponseModel;
  CitiesResponseModel? get citiesResponseModel => _citiesResponseModel;

  List<ci.Datum>? _cityData = [];
  List<ci.Datum>? get cityData => _cityData;
  List<ci.Datum>? _cityDataCopy = [];

  ViewHotelResponseModel? _viewHotelResponseModel;
  ViewHotelResponseModel? get viewHotelResponseModel => _viewHotelResponseModel;

  SearchedHotelsResponseModel? _searchedHotelsResponseModel;
  SearchedHotelsResponseModel? get searchedHotelsResponseModel =>
      _searchedHotelsResponseModel;
  List<se.Datum>? _searchedHotelsData = [];
  List<se.Datum>? _searchedHotelsDataCopy = [];
  List<se.Datum>? get searchedHotelsData => _searchedHotelsData;

  int cityPage = 1;
  int searchPage = 1;

  bool isLoadNoMore = false;
  bool isLoadNoMoreSearchHotel = false;

  AvailableRoomsResponseModel? _availableRoomsResponseModel;
  AvailableRoomsResponseModel? get availableRoomsResponseModel =>
      _availableRoomsResponseModel;
  RoomImageResponseModel? _roomImageResponseModel;
  RoomImageResponseModel? get roomImageResponseModel => _roomImageResponseModel;
  GetHotelCategoriesResponseModel? _getHotelCategoriesResponseModel;
  GetHotelCategoriesResponseModel? get getHotelCategoriesResponseModel =>
      _getHotelCategoriesResponseModel;

  Future<void> city({String? city, contxt}) async {
    try {
      _isLoadingCity = true;
      _citiesResponseModel = await runBusyFuture(
          repositoryImply.city(city: city, page: cityPage.toString()),
          throwException: true);
      _cityData = _citiesResponseModel!.data;
      _isLoadingCity = false;
    } catch (e) {
      _isLoadingCity = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoading(city) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_citiesResponseModel!.data!.length <
        _citiesResponseModel!.meta!.total!) {
      cityPage++;
      try {
        _citiesResponseModel = await runBusyFuture(
            repositoryImply.city(city: city, page: cityPage.toString()));
        _cityDataCopy!.addAll(_citiesResponseModel!.data!);
        _cityData!.addAll(_cityDataCopy!);
        _cityDataCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    notifyListeners();
  }

  Future<void> searchHotels({
    SearchedHotelsEntityModel? searchEntity,
    context,
  }) async {
    try {
      _isLoadingSearchHotels = true;
      _searchedHotelsResponseModel = await runBusyFuture(
          repositoryImply.searchedHotels(
              hotelEntityModel: searchEntity, page: searchPage.toString()),
          throwException: true);
      _searchedHotelsData = _searchedHotelsResponseModel!.data;
      _isLoadingSearchHotels = false;
    } catch (e) {
      _isLoadingSearchHotels = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshSearchHotels() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingSearchHotels(
      SearchedHotelsEntityModel searchEntity) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_searchedHotelsResponseModel!.data!.length <
        _searchedHotelsResponseModel!.meta!.total!) {
      searchPage++;
      try {
        _searchedHotelsResponseModel = await runBusyFuture(
            repositoryImply.searchedHotels(
                hotelEntityModel: searchEntity, page: searchPage.toString()));
        _searchedHotelsDataCopy!.addAll(_searchedHotelsResponseModel!.data!);
        _searchedHotelsData!.addAll(_searchedHotelsDataCopy!);
        _searchedHotelsDataCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreSearchHotel = true;
      null;
    }
    notifyListeners();
  }

  Future<void> availableRooms(
      {String? id, String? checkin, String? checkout, context}) async {
    try {
      _isLoading = true;
      _availableRoomsResponseModel = await runBusyFuture(
          repositoryImply.availableRooms(
              id: id, checkin: checkin, checkout: checkout),
          throwException: true);
      _isLoading = false;
      if (_availableRoomsResponseModel?.success == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HotelRoomCategory()));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> hotelCategory(
      {String? id, String? checkin, String? checkout, context}) async {
    try {
      _isLoading = true;
      _getHotelCategoriesResponseModel = await runBusyFuture(
          repositoryImply.getHotelCategory(
              id: id, checkin: checkin, checkout: checkout),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> roomImages({String? id, context}) async {
    try {
      _isLoading = true;
      _roomImageResponseModel = await runBusyFuture(
          repositoryImply.getRoomImage(id!),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
