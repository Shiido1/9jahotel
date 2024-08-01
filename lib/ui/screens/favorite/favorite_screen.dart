import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import '../../app_asset/app_image.dart';
import '../../widget/text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            TextView(
              text: 'My Favourites',
              fontSize: 24.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
            SizedBox(
              height: 40.h,
            ),
            ...[1, 2, 3, 4, 5].map(
              (o) => Stack(children: [
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
                  bottom: 32.0,
                  left: 6,
                  right: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Fairmont Hotel',
                            fontSize: 21.2.sp,
                            fontWeight: FontWeight.w700,
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
                                  text: 'Guzape 24231,Abuja F.C.T',
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
