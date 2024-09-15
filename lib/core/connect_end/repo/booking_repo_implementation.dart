import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../contract/booking_contract_implemention.dart';
import '../model/available_rooms_response_model/available_rooms_response_model.dart';
import '../model/cities_response_model/cities_response_model.dart';
import '../model/get_hotel_categories_response_model/get_hotel_categories_response_model.dart';
import '../model/room_image_response_model/room_image_response_model.dart';
import '../model/searched_hotels_entity_model.dart';
import '../model/searched_hotels_response_model/searched_hotels_response_model.dart';
import '../model/view_hotel_response_model/view_hotel_response_model.dart';

@lazySingleton
class BookingRepoImpl {
  final _contract = locator<BookingContractsImpl>();

  Future<CitiesResponseModel> city({String? city, String? page}) async {
    final response = await _contract.city(city: city, page: page);
    return response;
  }

  Future<ViewHotelResponseModel> viewHotels(String hotel) async {
    final response = await _contract.viewHotels(hotel);
    return response;
  }

  Future<SearchedHotelsResponseModel> searchedHotels(
      {SearchedHotelsEntityModel? hotelEntityModel, String? page}) async {
    final response = await _contract.searchedHotels(
        hotelEntityModel: hotelEntityModel, page: page);
    return response;
  }

  Future<AvailableRoomsResponseModel> availableRooms(
      {String? id, String? checkout, String? checkin}) async {
    final response = await _contract.availableRooms(
        id: id, checkin: checkin, checkout: checkout);
    return response;
  }

  Future<GetHotelCategoriesResponseModel> getHotelCategory(
      {String? id, String? checkout, String? checkin}) async {
    final response = await _contract.getHotelCategory(
        id: id, checkin: checkin, checkout: checkout);
    return response;
  }

  Future<RoomImageResponseModel> getRoomImage(String id) async {
    final response = await _contract.getRoomImage(id);
    return response;
  }
}
