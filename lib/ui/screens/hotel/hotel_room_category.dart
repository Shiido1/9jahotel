// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';

import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';
import 'hotel_screen.dart';

class HotelRoomCategory extends StatelessWidget {
  HotelRoomCategory({super.key});

  List<String> rooms = [
    '24',
    '243',
    '242',
    '245',
    '324',
    '344',
    '454',
    '324',
    '424',
    '444',
    '454',
    '404',
    '414',
    '434',
    '354',
    '464',
    '484',
    '334',
    '430',
    '432',
  ];

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
          child: Column(
            children: [
              TextView(
                text: 'Select available room ',
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                margin: EdgeInsets.only(left: 7.w, right: 7.w),
                color: AppColor.lightGrey,
                child: TextView(
                  text: '(Standard Category)',
                  fontSize: 16.6.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primary,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              
              SizedBox(
                height: 450.h,
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 10,
                  children: [...rooms.map((o) => contContainer(o))],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ButtonWidget(
                  buttonText: 'Continue',
                  buttonColor: AppColor.primary,
                  color: AppColor.white,
                  buttonWidth: double.infinity,
                  buttonBorderColor: AppColor.transparent,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HotelScreen()))),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  contContainer(text) => Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: AppColor.darkgrey,
            border: Border(
                top: BorderSide(color: AppColor.lightGrey, width: 10.sp))),
        child: Center(
          child: TextView(
            text: text,
            fontSize: 21.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.white,
          ),
        ),
      );
}
