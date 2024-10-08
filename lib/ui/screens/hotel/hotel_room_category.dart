// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/core/core_folder/app/app.router.dart';
import 'package:ninejahotel/main.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/model/available_rooms_response_model/datum.dart';
import '../../../core/connect_end/view_model/bookings_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';
import 'hotel_screen.dart';

class HotelRoomCategory extends StatelessWidget {
  HotelRoomCategory({super.key});


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
      body: ViewModelBuilder<BookingsViewModel>.reactive(
          viewModelBuilder: () => locator<BookingsViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, BookingsViewModel model, __) {
            return SingleChildScrollView(
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
                    if (model.availableRoomsResponseModel != null)
                      SizedBox(
                        height: 450.h,
                        child: GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 13,
                          crossAxisSpacing: 10,
                          children: [
                            ...model.availableRoomsResponseModel!.data!.map(
                                (o) => contContainer(o: o, context: context))
                          ],
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
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HotelScreen()))),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  contContainer({Datum? o, context}) => GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColor.black, // To make it full-screen
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: .2,
              minChildSize: 0.12,
              maxChildSize: .35,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    height: MediaQuery.of(context).size.height *
                        0.9, // Nearly full screen
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Select Room',
                          style: TextStyle(fontSize: 18, color: AppColor.white),
                        ),
                        SizedBox(height: 6.h),
                        Divider(
                          color: AppColor.white,
                        ),
                        SizedBox(height: 6.h),
                        GestureDetector(
                          onTap: () => navigate.navigateTo(Routes.tourRoomScreen),
                          child: Text(
                            'Room Tour',
                            style: TextStyle(fontSize: 18, color: AppColor.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        child: Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              color: AppColor.darkgrey,
              border: Border(
                  top: BorderSide(color: AppColor.lightGrey, width: 10.sp))),
          child: Center(
            child: TextView(
              text: o?.number ?? '',
              fontSize: 21.2.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
          ),
        ),
      );
}
