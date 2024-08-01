import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';

import '../../widget/text_widget.dart';
import '../hotel/hotel_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 60.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColor.primary1,
                                      border:
                                          Border.all(color: AppColor.black)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 4.8.w),
                                  height: 60.h,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    color: AppColor.primary,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: SvgPicture.asset(
                                      AppImage.setting,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 300.h,
                          ),
                          ...[1, 2, 3, 4, 5].map(
                            (o) => GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HotelDetail())),
                              child: Stack(children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.w),
                                  height: 240.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColor.primary1,
                                      border:
                                          Border.all(color: AppColor.black)),
                                ),
                                Image.asset(
                                  AppImage.hot,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                  height: 128.0.h,
                                ),
                                Positioned(
                                  bottom: 32.0,
                                  left: 6,
                                  right: 10,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Fairmont Hotel',
                                            fontSize: 21.2.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.black,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2.2.w),
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
                                                  text:
                                                      'Guzape 24231,Abuja F.C.T',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                text: '120 Reviews',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.grey,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextView(
                                            text: 'N199,000',
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
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
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
  }
}
