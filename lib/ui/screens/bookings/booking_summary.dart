import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/screens/bookings/booking_info_screen.dart';
import '../../app_asset/app_image.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        title: TextView(
          text: 'Booking Summary',
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
        padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Booking Detail',
              fontSize: 19.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
            SizedBox(
              height: 20.h,
            ),
            proDetails(
                text: 'Guest',
                text1: '1 Adults',
                image: AppImage.profile,
                color: AppColor.white),
            proDetails(
                text: 'Hotel',
                text1: 'Fairmont Hotel',
                image: AppImage.hotel,
                color: AppColor.white),
            proDetails(
                text: 'Location',
                text1: 'Guzape 24231, Abuja F.C.T',
                image: AppImage.location,
                color: AppColor.white),
            proDetails(
                text: 'Room Number',
                text1: '108B',
                image: AppImage.book,
                color: AppColor.white),
            proDetails(
                text: 'Check In',
                text1: 'JAN. 22ND 2024',
                image: AppImage.clock,
                color: AppColor.white),
            proDetails(
                text: 'Check Out',
                text1: 'JAN. 23RD 2024',
                image: AppImage.clock,
                color: AppColor.white),
            proDetails(
                text: 'Night',
                text1: '1',
                image: AppImage.calendar,
                color: AppColor.white,
                islogout: true),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Payment Summary',
              fontSize: 19.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Tata Travel Bus Ticketing',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                    TextView(
                      text: 'N119',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1.sp,
                  color: AppColor.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Subtotal',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                    TextView(
                      text: 'N119',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Service charge',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                    TextView(
                      text: 'N0.39',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Discount',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                    TextView(
                      text: 'N0',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
            Divider(
              thickness: 1.sp,
              color: AppColor.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Total',
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
                TextView(
                  text: 'N119.39',
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                      buttonText: 'Pay On Arrival',
                      buttonColor: AppColor.transparent,
                      color: AppColor.white,
                      buttonBorderColor: AppColor.white,
                      onPressed: () {}),
                ),
                SizedBox(
                  width: 16.h,
                ),
                Expanded(
                  child: ButtonWidget(
                      buttonText: 'Pay Now',
                      buttonColor: AppColor.primary,
                      color: AppColor.white,
                      buttonBorderColor: AppColor.white,
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BookingInfoScreen()))),
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }

  proDetails({text, text1, image, color, islogout = false}) => Padding(
        padding:
            !islogout ? EdgeInsets.only(top: 8.w) : EdgeInsets.only(top: 0.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(
                    image,
                    color: AppColor.primary,
                    height: 22.h,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: text,
                      fontSize: 13.8.sp,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                    TextView(
                      text: text1,
                      fontSize: 15.6.sp,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: !islogout ? 6.h : 0.h,
            ),
            !islogout
                ? Divider(
                    color: AppColor.white,
                    thickness: 1.2.sp,
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
}
