import 'package:injectable/injectable.dart';
import 'package:ninejahotel/core/api_folder/booking_api.dart';
import 'package:ninejahotel/core/connect_end/model/available_rooms_response_model/available_rooms_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/cities_response_model/cities_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/get_hotel_categories_response_model/get_hotel_categories_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/room_image_response_model/room_image_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_entity_model.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_response_model/searched_hotels_response_model.dart';
import 'package:ninejahotel/core/connect_end/model/view_hotel_response_model/view_hotel_response_model.dart';
import '../../core_folder/app/app.locator.dart';

@lazySingleton
class BookingContractsImpl {
  final _api = locator<BookingApi>();

  Future<CitiesResponseModel> city({String? city, String? page}) async =>
      await _api.city(city: city!, page: page!);

  Future<SearchedHotelsResponseModel> searchedHotels(
          {SearchedHotelsEntityModel? hotelEntityModel, String? page}) async =>
      await _api.searchHotels(hotel: hotelEntityModel, page: page);

  Future<ViewHotelResponseModel> viewHotels(String hotel) async =>
      await _api.viewHotels(hotel);
  Future<AvailableRoomsResponseModel> availableRooms(
          {String? id, String? checkout, String? checkin}) async =>
      await _api.availableRooms(id: id, checkin: checkin, checkout: checkout);
  Future<GetHotelCategoriesResponseModel> getHotelCategory(
          {String? id, String? checkout, String? checkin}) async =>
      await _api.getHotelCategory(id: id, checkin: checkin, checkout: checkout);
  Future<RoomImageResponseModel> getRoomImage(String id) async =>
      await _api.getRoomImage(id);
}
