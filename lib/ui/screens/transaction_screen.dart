import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import '../app_asset/app_color.dart';
import '../widget/text_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              TextView(
                text: 'Transaction Complete',
                fontSize: 21.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
              SizedBox(
                height: 60.h,
              ),
              SvgPicture.asset(
                AppImage.complete,
                height: 168.h,
                width: 168.w,
              ),
              SizedBox(
                height: 60.h,
              ),
              TextView(
                text:
                    'Payment of N38,300 for 14 Nights 3 Star package was successful and your booking details as been sent to your email.  ',
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
