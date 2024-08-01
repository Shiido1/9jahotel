import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';

import '../../widget/text_widget.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20.sp,
              color: AppColor.white,
            )),
        title: TextView(
          text: 'Earnings',
          fontSize: 25.2.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 16.w),
        child: Column(
          children: [
            Container(
              color: AppColor.darkgrey,
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Total reward earned',
                    fontSize: 15.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextView(
                    text: '₦2,000',
                    fontSize: 25.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: const BoxDecoration(
                  color: AppColor.primarylight, shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                size: 32.sp,
                color: AppColor.primary,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              color: AppColor.darkgrey,
              width: double.infinity,
              padding: EdgeInsets.all(18.w),
              child: Column(
                children: [
                  TextView(
                    text: 'Invite friends',
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TextView(
                            text: 'Booking status',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextView(
                            text: '3',
                            fontSize: 25.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: const BoxDecoration(
                                    color: AppColor.primarylight,
                                    shape: BoxShape.circle),
                                child: TextView(
                                  text: '%',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary,
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              TextView(
                                text: 'Reward earned',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextView(
                            text: '₦2,000',
                            fontSize: 25.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
