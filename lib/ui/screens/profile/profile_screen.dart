// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';

import '../../../core/core_folder/manager/shared_preference.dart';
import '../../widget/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _session = SharedPreferencesService();

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
                  _session.usersData["user"] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(34.0),
                          child: Container(
                            color: AppColor.white.withOpacity(.2),
                            padding: EdgeInsets.all(2.2.w),
                            child: Icon(
                              Icons.person,
                              size: 54.8.sp,
                              color: AppColor.white,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(34.0),
                          child: _session.isLoggedInFb == true
                              ? Image.network(
                                  '${_session.usersData['picture']['data']['url']}',
                                  height: 64.8.h,
                                  width: 64.8.w,
                                )
                              : Image.network(
                                  '${_session.usersData['picture']}',
                                  height: 64.8.h,
                                  width: 64.8.w,
                                ),
                        ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextView(
                        text: _session.usersData["user"] != null
                            ? '${_session.usersData["user"]["firstname"]} ${_session.usersData["user"]["lastname"]}'
                            : '${_session.usersData['name']}',
                        fontSize: 21.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                      TextView(
                        text: _session.usersData["user"] != null
                            ? '${_session.usersData["user"]["email"]}'
                            : '${_session.usersData['email']}',
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
            GestureDetector(
              onTap: () => _session.logOut(context),
              child: Container(
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
            ),
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
