import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import 'package:ninejahotel/ui/screens/bookings/booking_summary.dart';
import '../../../app_asset/app_color.dart';
import '../../../widget/text_widget.dart';

class UpcomingTabScreen extends StatelessWidget {
  const UpcomingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: SingleChildScrollView(
          child: Column(
        children: [
          ...[
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
          ].map((o) => upcomingWidget(context))
        ],
      )),
    );
  }

  upcomingWidget(context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BookingSummary())),
        child: Container(
          margin: EdgeInsets.only(bottom: 20.w),
          color: AppColor.darkgrey,
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    color: AppColor.primary,
                    child: TextView(
                      text: 'Upcoming',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(
                    width: 12.2.w,
                  ),
                  TextView(
                    text: 'Room 108B',
                    fontSize: 15.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                  const Spacer(),
                  Container(
                    height: 38.0.h,
                    width: 72.2,
                    color: AppColor.white,
                    child: Image.asset(AppImage.tabpic),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Fairmont Hotel',
                    fontSize: 18.2.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    TextView(
                      text: 'Check In',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.w),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.grey,
                          border: Border.all(color: AppColor.white)),
                    ),
                    SizedBox(
                      width: 75.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.w),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.grey,
                          border: Border.all(color: AppColor.white)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextView(
                      text: 'Check Out',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.white,
                    ),
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    TextView(
                      text: 'JAN. 22TH 2022',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    TextView(
                      text: 'JAN. 22TH 2022',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      color: AppColor.white,
                      child: TextView(
                        text: '1 Adult',
                        fontSize: 12.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.red,
                      ),
                    ),
                    const Spacer(),
                    ...[1, 2, 3, 4, 5].map((o) => Icon(Icons.star,
                        size: 14.sp,
                        color: o == 5 ? AppColor.white : AppColor.primary)),
                  ])
                ],
              )
            ],
          ),
        ),
      );
}
