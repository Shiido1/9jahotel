// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';
import 'package:ninejahotel/ui/screens/hotel/hotel_detail.dart';
import '../../app_asset/app_color.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

class HotelScreen extends StatelessWidget {
  HotelScreen({super.key});

  List<String> listTitle = ['Classic', 'Presidential', 'Basic', 'Traveller'];

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
            text: 'Fairmont Hotel',
            fontSize: 25.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
            child: Center(
                child: Column(children: [
              TextView(
                text: 'Select the room category you will like to book',
                fontSize: 15.2.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
              SizedBox(
                height: 40.h,
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 20 // ** add this **
                    ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [...listTitle.map((o) => cont(text: o))],
              ),
              SizedBox(
                height: 40.h,
              ),
              ButtonWidget(
                  buttonText: 'Continue',
                  buttonColor: AppColor.primary,
                  color: AppColor.white,
                  buttonWidth: double.infinity,
                  buttonBorderColor: AppColor.transparent,
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HotelDetail()))),
              SizedBox(
                height: 40.h,
              ),
            ]))));
  }

  cont({text}) => Container(
        padding: EdgeInsets.all(16.w),
        color: AppColor.lightGrey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextView(
                text: text,
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightGrey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SvgPicture.asset(AppImage.booksaved)),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(6.w),
              color: AppColor.primary,
              child: TextView(
                text: 'Amount',
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            TextView(
              text: '₦382,809',
              fontSize: 17.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.black,
            )
          ],
        ),
      );
}
