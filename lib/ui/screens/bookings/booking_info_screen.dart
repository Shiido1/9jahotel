// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';

import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';
import '../../widget/text_widget.dart';
import '../hotel/hotel_room_category.dart';

class BookingInfoScreen extends StatelessWidget {
  const BookingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        title: TextView(
          text: 'Booking Information',
          fontSize: 23.2.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20.sp,
              color: AppColor.white,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 6.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              margin: EdgeInsets.only(left: 7.w, right: 7.w),
              color: AppColor.lightGrey,
              child: TextView(
                text: 'Fairmont Hotel [Room 250 (Standard)]',
                fontSize: 16.6.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primary,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              color: AppColor.darkgrey,
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TextFormWidget(
                              label: 'JAN.22TH',
                              prefixWidget: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppImage.calendar,
                                  color: AppColor.white,
                                ),
                              ))),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        margin: EdgeInsets.only(top: 10.w),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.white, width: 1)),
                        child: TextView(
                          text: '1 Night',
                          fontSize: 12.6.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: TextFormWidget(
                        label: 'JAN.22TH',
                        labelStyle: const TextStyle(color: AppColor.white),
                        // labelColor: AppColor.white,
                        prefixWidget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            AppImage.calendar,
                            color: AppColor.white,
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  TextFormWidget(
                    label: 'Guest',
                    labelStyle: const TextStyle(color: AppColor.white),
                    // labelColor: AppColor.white,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImage.profile,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormWidget(
                    label: 'ID card type',
                    labelStyle: const TextStyle(color: AppColor.white),
                    // labelColor: AppColor.white,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImage.profile,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormWidget(
                    label: 'ID card number',
                    labelStyle: const TextStyle(color: AppColor.white),
                    // labelColor: AppColor.white,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImage.profile,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [10, 10],
                    color: AppColor.white,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.w),
                      color: AppColor.lightGrey,
                      child: Column(
                        children: [
                          SvgPicture.asset(AppImage.gallery),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Upload an you ID cardimage  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary,
                                  fontSize: 15.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'or drag and drop (8 images max)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black,
                                        fontSize: 15.sp)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextView(
                            text: 'PNG, JPG, GIF up to 10MB',
                            fontSize: 13.6.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ButtonWidget(
                buttonText: 'Check Out',
                buttonColor: AppColor.primary,
                color: AppColor.white,
                buttonWidth: double.infinity,
                buttonBorderColor: AppColor.transparent,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HotelRoomCategory()))),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
