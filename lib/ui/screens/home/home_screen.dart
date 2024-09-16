// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:intl/intl.dart';
import 'package:ninejahotel/core/connect_end/model/searched_hotels_entity_model.dart';
import 'package:ninejahotel/core/connect_end/view_model/bookings_view_model.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../core/connect_end/model/searched_hotels_response_model/datum.dart';
import '../../../core/connect_end/view_model/favorites_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_asset/app_validation.dart';
import '../../widget/text_form_widget.dart';
import '../../widget/text_widget.dart';
import '../hotel/hotel_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Debouncer _debouncer;
  TextEditingController cityController = TextEditingController();

  RefreshController? refreshControllerCity = RefreshController();
  RefreshController? refreshControllerSearchHotels = RefreshController();

  String cityText = '';

  String cityId = '';
  String checkin = 'Check-In';
  String checkout = 'Check-Out';

  bool isCitySelected = false;

  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckOutDate = DateTime.now();

  String? _formattedCheckInDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  String? _formattedCheckOutDate =
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectCheckInDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckinDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      _formattedCheckInDate =
          DateFormat('dd-MM-yyyy').format(selectedCheckinDate);

      checkin = _formattedCheckInDate!;
      setState(() {});
    }
  }

  Future<void> selectCheckOutDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedCheckOutDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedCheckOutDate) {
      selectedCheckOutDate = picked;
      _formattedCheckOutDate =
          DateFormat('dd-MM-yyyy').format(selectedCheckOutDate);

      checkout = _formattedCheckOutDate!;
      setState(() {});
    }
  }

  @override
  void initState() {
    _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingsViewModel>.reactive(
        viewModelBuilder: () => locator<BookingsViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, BookingsViewModel model, __) {
          return Scaffold(
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppImage.map,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(1.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.w),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextFormWidget(
                                  hint: 'City',
                                  label: 'Type first three letters',
                                  cusorColor:
                                      const Color.fromARGB(255, 52, 108, 108),
                                  hintColor:
                                      const Color.fromARGB(255, 52, 108, 108),
                                  labelColor:
                                      const Color.fromARGB(255, 59, 109, 109),
                                  fillColor: AppColor.primary1,
                                  isFilled: true,
                                  suffixWidget: model.isLoadingCity
                                      ? SpinKitRipple(
                                          color: AppColor.primary,
                                          size: 20.sp,
                                        )
                                      : const Icon(Icons.search),
                                  suffixIconColor: AppColor.black,
                                  controller: cityController,
                                  onChange: (p0) {
                                    if (p0.isNotEmpty) {
                                      _debouncer.call(() {
                                        cityText = p0;
                                        model.city(city: p0, contxt: context);
                                        setState(() {});
                                        model.notifyListeners();
                                      });
                                    }
                                  },
                                  validator: AppValidator.validateString(),
                                ),
                                SizedBox(
                                  height: model.cityData!.isNotEmpty ||
                                          cityText != ''
                                      ? 20.h
                                      : 0.h,
                                ),
                                model.cityData!.isNotEmpty && cityText != ''
                                    ? Container(
                                        height: model.cityData!.length > 3
                                            ? 200.h
                                            : 80.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SmartRefresher(
                                          key: const PageStorageKey(
                                              'storage_key'),
                                          enablePullUp: true,
                                          enablePullDown: false,
                                          onRefresh: () async {
                                            await model.onRefresh();
                                            model.city(
                                                city: cityText,
                                                contxt: context);
                                            refreshControllerCity
                                                ?.refreshCompleted();
                                          },
                                          onLoading: () async {
                                            await model.onLoading(cityText);
                                            refreshControllerCity
                                                ?.loadComplete();
                                          },
                                          controller: refreshControllerCity!,
                                          footer: CustomFooter(
                                              builder: ((context, mode) {
                                            Widget body;
                                            if (model.citiesResponseModel !=
                                                    null &&
                                                model.citiesResponseModel!.data!
                                                    .isEmpty) {
                                              body = TextView(
                                                  text: "You're caught up",
                                                  color: AppColor.darkgrey);
                                            } else if (mode ==
                                                    LoadStatus.idle &&
                                                model.isLoadNoMore == false) {
                                              body = TextView(
                                                text: "Pull up load",
                                                color: AppColor.darkgrey,
                                              );
                                            } else if (mode ==
                                                LoadStatus.loading) {
                                              body =
                                                  const CupertinoActivityIndicator();
                                            } else if (mode ==
                                                LoadStatus.failed) {
                                              body = TextView(
                                                  text:
                                                      "Load Failed!Click retry!",
                                                  color: AppColor.darkgrey);
                                            } else if (mode ==
                                                LoadStatus.canLoading) {
                                              body = TextView(
                                                  text: "release to load more",
                                                  color: AppColor.darkgrey);
                                            } else {
                                              body = TextView(
                                                  text: "You're caught up",
                                                  color: AppColor.darkgrey);
                                            }
                                            return SizedBox(
                                              height: 50.0,
                                              child: Center(child: body),
                                            );
                                          })),
                                          child: SingleChildScrollView(
                                            padding: EdgeInsets.only(
                                                bottom: 10.w, left: 10.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                ...model.cityData!.map((e) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        cityController.text =
                                                            e.name ?? '';
                                                        cityId =
                                                            e.id.toString();
                                                        isCitySelected = true;

                                                        setState(() {});
                                                        model.cityData!.clear();
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.w),
                                                        child: TextView(
                                                          text: e.name ?? '',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                isCitySelected
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () =>
                                                selectCheckInDate(context),
                                            child: Card(
                                              elevation: 1,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    11.2.w,
                                                    9.0.w,
                                                    11.2.w,
                                                    9.0.w),
                                                decoration: BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextView(
                                                  text: checkin,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                selectCheckOutDate(context),
                                            child: Card(
                                              elevation: 1,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    11.2.w,
                                                    9.0.w,
                                                    11.2.w,
                                                    9.0.w),
                                                decoration: BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextView(
                                                  text: checkout,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => model.searchHotels(
                                                context: context,
                                                searchEntity:
                                                    SearchedHotelsEntityModel(
                                                        checkedIn: checkin,
                                                        checkedOut: checkout,
                                                        cityId: cityId)),
                                            child: Card(
                                              elevation: 1,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    11.2.w,
                                                    9.0.w,
                                                    11.2.w,
                                                    9.0.w),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: model
                                                        .isLoadingSearchHotels
                                                    ? SpinKitCircle(
                                                        color: AppColor.white,
                                                        size: 20.sp,
                                                      )
                                                    : TextView(
                                                        text: 'Search',
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColor.white,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                SizedBox(
                                  height: 200.h,
                                ),
                                if (model.searchedHotelsResponseModel != null ||
                                    model.searchedHotelsData!.isNotEmpty)
                                  SizedBox(
                                    height: 400,
                                    child: SmartRefresher(
                                      key: const PageStorageKey(
                                          'storage_search_key'),
                                      enablePullUp: true,
                                      enablePullDown: false,
                                      onRefresh: () async {
                                        await model.onRefreshSearchHotels();
                                        model.searchHotels(
                                            context: context,
                                            searchEntity:
                                                SearchedHotelsEntityModel(
                                                    checkedIn: checkin,
                                                    checkedOut: checkout,
                                                    cityId: cityId));
                                        refreshControllerSearchHotels
                                            ?.refreshCompleted();
                                      },
                                      onLoading: () async {
                                        await model.onLoadingSearchHotels(
                                            SearchedHotelsEntityModel(
                                                checkedIn: checkin,
                                                checkedOut: checkout,
                                                cityId: cityId));
                                        refreshControllerSearchHotels
                                            ?.loadComplete();
                                      },
                                      controller:
                                          refreshControllerSearchHotels!,
                                      footer: CustomFooter(
                                          builder: ((context, mode) {
                                        Widget body;
                                        if (model.searchedHotelsResponseModel !=
                                                null &&
                                            model.searchedHotelsResponseModel!
                                                .data!.isEmpty) {
                                          body = TextView(
                                              text: "You're caught up",
                                              color: AppColor.white);
                                        } else if (mode == LoadStatus.idle &&
                                            model.isLoadNoMore == false) {
                                          body = TextView(
                                            text: "Pull up load",
                                            color: AppColor.white,
                                          );
                                        } else if (mode == LoadStatus.loading) {
                                          body =
                                              const CupertinoActivityIndicator(
                                                  color: AppColor.white);
                                        } else if (mode == LoadStatus.failed) {
                                          body = TextView(
                                              text: "Load Failed!Click retry!",
                                              color: AppColor.white);
                                        } else if (mode ==
                                            LoadStatus.canLoading) {
                                          body = TextView(
                                              text: "release to load more",
                                              color: AppColor.white);
                                        } else {
                                          body = TextView(
                                              text: "You're caught up",
                                              color: AppColor.white);
                                        }
                                        return SizedBox(
                                          height: 50.0,
                                          child: Center(child: body),
                                        );
                                      })),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...model.searchedHotelsData!.map(
                                              (o) => hotelListContainer(
                                                  context: context, d: o),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                else if (model.searchedHotelsResponseModel ==
                                        null &&
                                    model.searchedHotelsData!.isEmpty)
                                  TextView(
                                    text: "NO HOTEL",
                                    color: AppColor.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                SizedBox(
                                  height: 50.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  hotelListContainer({context, Datum? d}) =>
      ViewModelBuilder<FavoritesViewModel>.reactive(
          viewModelBuilder: () => locator<FavoritesViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, FavoritesViewModel model, __) {
            return GestureDetector(
              onDoubleTap: () => model.addFavorite(d.code, context),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HotelDetail(data: d))),
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  height: 240.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.primary1,
                      border: Border.all(color: AppColor.black)),
                ),
                Image.asset(
                  AppImage.hot,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 128.0.h,
                ),
                Positioned(
                  bottom: 30.0,
                  left: 6,
                  right: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: TextView(
                              text: d?.name ?? '',
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontSize: 21.2.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.2.w),
                                child: Icon(
                                  Icons.location_on_rounded,
                                  size: 17.2.sp,
                                  color:
                                      const Color.fromARGB(255, 106, 165, 165),
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              SizedBox(
                                width: 168.0.w,
                                child: TextView(
                                  text: d?.address ?? '',
                                  fontSize: 14.2.sp,
                                  maxLines: 2,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (d!.rating!.toLowerCase() ==
                                  'no rating yet'.toLowerCase())
                                TextView(
                                  text: 'No Ratings',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary,
                                )
                              else
                                ...List.filled(int.parse(d.rating!), 0)
                                    .map((o) => Icon(
                                          Icons.star,
                                          size: 14.sp,
                                          color: AppColor.primary,
                                        )),
                              SizedBox(
                                width: 20.w,
                              ),
                              if (d.reviews!.toLowerCase() ==
                                  'no reviews yet'.toLowerCase())
                                TextView(
                                  text: 'No Reviews',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,
                                )
                              else
                                TextView(
                                  text: '${d.reviews} Reviews',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grey,
                                )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextView(
                            text: 'N${d.onlinePrice}',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                          TextView(
                            text: '/Per Night',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            );
          });
}
