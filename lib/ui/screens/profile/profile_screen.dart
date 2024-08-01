// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';

import '../../widget/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              color: AppColor.darkgrey,
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  Image.asset(
                    AppImage.pro,
                    height: 64.8.h,
                    width: 64.8.w,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Mahdi Ibrahim',
                        fontSize: 21.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                      TextView(
                        text: 'ibrahim34523',
                        fontSize: 15.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                contContainer(text: 'Hotel', text2: '234'),
                contContainer(text: 'Days', text2: '234'),
                contContainer(text: 'Cities', text2: '234'),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(22.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColor.darkgrey),
                child: Column(
                  children: [
                    proDetails(
                        text: 'Personal info',
                        image: AppImage.profile,
                        color: AppColor.white),
                    proDetails(
                        text: 'Payment Methods',
                        image: AppImage.card,
                        color: AppColor.white),
                    proDetails(
                        text: 'Help Center',
                        image: AppImage.help,
                        color: AppColor.white),
                    proDetails(
                        text: 'Privacy Settings',
                        image: AppImage.lock,
                        color: AppColor.white),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(22.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColor.darkgrey),
                child: Column(
                  children: [
                    proDetails(
                        text: 'Log Out',
                        image: AppImage.logincurve,
                        islogout: true,
                        color: AppColor.red),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  proDetails({text, image, color, islogout = false}) => Padding(
        padding:
            !islogout ? EdgeInsets.only(top: 8.w) : EdgeInsets.only(top: 0.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: !islogout ? AppColor.lightGrey : AppColor.lightred,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.white)),
                  child: SvgPicture.asset(
                    image,
                    color: !islogout ? AppColor.primary : AppColor.red,
                    height: 22.h,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                TextView(
                  text: text,
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.sp,
                  color: AppColor.white,
                )
              ],
            ),
            SizedBox(
              height: !islogout ? 6.h : 0.h,
            ),
            !islogout
                ? Divider(
                    color: AppColor.white,
                    thickness: .5.sp,
                  )
                : const SizedBox.shrink()
          ],
        ),
      );

  contContainer({text, text2}) => Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: AppColor.darkgrey,
            border: Border(
                top: BorderSide(color: AppColor.lightGrey, width: 10.sp))),
        child: Column(
          children: [
            TextView(
              text: text,
              fontSize: 15.2.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            ),
            TextView(
              text: text2,
              fontSize: 21.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            )
          ],
        ),
      );
}
