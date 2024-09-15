import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ninejahotel/core/connect_end/model/available_rooms_response_model/available_rooms_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/cities_response_model/cities_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_hotel_categories_response_model/get_hotel_categories_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/room_image_response_model/room_image_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_entity_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_response_model/searched_hotels_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/view_hotel_response_model/view_hotel_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class BookingApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('BookingViewModel');

  Future<CitiesResponseModel> city({String? city, String? page}) async {
    try {
      final response = await _service.call(UrlConfig.city, RequestMethod.get,
          data: {"city": city, "page": page});
      logger.d(response.data);
      return CitiesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SearchedHotelsResponseModel> searchHotels(
      {SearchedHotelsEntityModel? hotel, String? page}) async {
    try {
      final response = await _service.call(
          UrlConfig.search_hotels, RequestMethod.post,
          data: FormData.fromMap(hotel!.toJson()), queryParams: {"page": page});
      logger.d(response.data);
      return SearchedHotelsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ViewHotelResponseModel> viewHotels(String hotel) async {
    try {
      final response = await _service.call(
          '${UrlConfig.view_hotel}/$hotel', RequestMethod.get);
      logger.d(response.data);
      return ViewHotelResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<AvailableRoomsResponseModel> availableRooms(
      {String? id, String? checkout, String? checkin}) async {
    try {
      final response = await _service.call(
          '${UrlConfig.category}/$id/rooms', RequestMethod.get,
          data: {'check_in': checkin, 'check_out': checkout});
      logger.d(response.data);
      return AvailableRoomsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetHotelCategoriesResponseModel> getHotelCategory(
      {String? id, String? checkout, String? checkin}) async {
    try {
      final response = await _service.call(
          '${UrlConfig.view_hotel}/$id/categories', RequestMethod.get,
          data: {'checkin': checkin, 'checkout': checkout});
      logger.d(response.data);
      return GetHotelCategoriesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<RoomImageResponseModel> getRoomImage(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.room}/$id/images', RequestMethod.get);
      logger.d(response.data);
      return RoomImageResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
