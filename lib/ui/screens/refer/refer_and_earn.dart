// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/screens/refer/earnings_screen.dart';
import 'package:ninejahotel/ui/screens/transaction_screen.dart';
import '../../app_asset/app_image.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        centerTitle: true,
        title: TextView(
          text: 'Refer & Earn',
          fontSize: 25.2.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 90.w, horizontal: 10.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImage.gift,
                color: AppColor.primary,
                height: 148.h,
                width: 148.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: TextView(
                  text:
                      'Earn up to ₦1,000 when you share your referral code with your friend',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  color: AppColor.white,
                ),
              ),
              SizedBox(
                height: 166.h,
              ),
              ButtonWidget(
                  buttonText: 'SHARE CODE: JOHNDOE',
                  buttonColor: AppColor.primary,
                  buttonWidth: double.infinity,
                  color: AppColor.white,
                  buttonBorderColor: AppColor.transparent,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TransactionScreen()))),
              SizedBox(
                height: 16.h,
              ),
              ButtonWidget(
                  buttonText: 'View Earnings',
                  buttonColor: AppColor.transparent,
                  buttonWidth: double.infinity,
                  color: AppColor.white,
                  buttonBorderColor: AppColor.white,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EarningsScreen())))
            ],
          ),
        ),
      ),
    );
  }
}
