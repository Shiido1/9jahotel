// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/core/core_folder/app/app.router.dart';
import 'package:ninejahotel/main.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import '../../../core/connect_end/model/searched_hotels_response_model/datum.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

class HotelDetail extends StatelessWidget {
  HotelDetail({super.key, this.data});
  Datum? data;

  List<String> svgImage = [
    AppImage.wifi,
    AppImage.dinner,
    AppImage.lock1,
    AppImage.swimming,
    AppImage.car
  ];

  @override
  Widget build(BuildContext context) {
    print('print......${data?.toJson()}');
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColor.white,
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) {
                      return Padding(
                        padding: EdgeInsets.only(top: 42.w),
                        child: Center(
                          child: Icon(
                            Icons.error,
                            size: 30.sp,
                            color: AppColor.darkgrey,
                          ),
                        ),
                      );
                    },
                    data?.image ?? '',
                    height: 300.h,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 14,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20.sp,
                        color: AppColor.white,
                      )),
                ),
                Positioned(
                    bottom: -60,
                    left: 26.0,
                    child: Container(
                      color: AppColor.lightGrey,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.w, horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: data?.name ?? '',
                                fontSize: 19.2.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.2.w),
                                    child: Icon(
                                      Icons.location_on_rounded,
                                      size: 17.2.sp,
                                      color: const Color.fromARGB(
                                          255, 106, 165, 165),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  SizedBox(
                                    width: 168.0.w,
                                    child: TextView(
                                      text: data?.address ?? '',
                                      fontSize: 12.2.sp,
                                      maxLines: 2,
                                      fontWeight: FontWeight.w500,
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
                                  ...[1, 2, 3, 4].map((o) => Icon(
                                        Icons.star,
                                        size: 14.sp,
                                        color: AppColor.primary,
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  TextView(
                                    text: data?.reviews ?? '',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
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
                                text: 'N${data?.onlinePrice}',
                                fontSize: 17.2.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primary,
                              ),
                              TextView(
                                text: '/Per Night',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Amenities',
                    fontSize: 21.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...svgImage.map((o) {
                        return amenitiesWidget(
                            image: o,
                            isSwim:
                                o == 'assets/svg/swimming.svg' ? true : false);
                      })
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    color: AppColor.darkgrey,
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Description',
                          fontSize: 21.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextView(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu amet tempor, in massa, tincidunt. Ac turpis amet vitae dui aliquam vitae nunc. Non enim, lorem duis maecenas odio',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.white,
                        ),
                        TextView(
                          text: 'Read More ',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextView(
                    text: 'Map',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(AppImage.map2),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    color: AppColor.darkgrey,
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextView(
                              text: '4.7',
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.white,
                            ),
                            SizedBox(
                              width: 24.0.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Review summary',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                                Row(
                                  children: [
                                    ...[1, 2, 3, 4, 5].map((o) => Icon(
                                        Icons.star,
                                        size: 14.sp,
                                        color: o == 5
                                            ? AppColor.white
                                            : AppColor.primary)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        reviewWidget(text: '5', width: 240.w),
                        reviewWidget(text: '4', width: 140.w),
                        reviewWidget(text: '3', width: 80.w),
                        reviewWidget(text: '2', width: 20.w),
                        reviewWidget(text: '1', width: 8.w),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Reviews (33)',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      TextView(
                        text: 'View all',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImage.pro,
                        height: 40.h,
                        width: 40.w,
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Kang Jhon',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                          TextView(
                            text: '3 Hours 43 Minute Ago',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextView(
                            text: 'Rating',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                          ),
                          Row(
                            children: [
                              ...[1, 2, 3, 4, 5].map((o) => Icon(Icons.star,
                                  size: 14.sp,
                                  color: o == 5
                                      ? AppColor.white
                                      : AppColor.primary)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextView(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, dolor sit amet',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextView(
                    text: 'Reply',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  ButtonWidget(
                      buttonText: 'Book Room',
                      buttonColor: AppColor.primary,
                      color: AppColor.white,
                      buttonWidth: double.infinity,
                      buttonBorderColor: AppColor.transparent,
                      onPressed: () => navigate.navigateTo(
                          Routes.bookingInfoScreen,
                          arguments: BookingInfoScreenArguments(d: data))),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  reviewWidget({text, width}) => Row(
        children: [
          TextView(
            text: text,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.white,
          ),
          Icon(Icons.star, size: 14.sp, color: AppColor.primary),
          SizedBox(
            width: 34.0.w,
          ),
          Container(
            height: 7.h,
            width: width,
            color: AppColor.primary,
          )
        ],
      );

  amenitiesWidget({image, isSwim = false}) => Container(
        padding: EdgeInsets.all(14.w),
        color: AppColor.darkgrey,
        child: SvgPicture.asset(
          image,
          height: isSwim ? 22 : 25,
          width: isSwim ? 20 : 22,
        ),
      );
}
