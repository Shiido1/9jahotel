import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';

import '../../widget/text_widget.dart';
import 'tabs_screen/cancelled_tab_screen.dart';
import 'tabs_screen/completed_tab_screen.dart';
import 'tabs_screen/upcoming_tab_screen.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              TextView(
                text: 'Bookings',
                fontSize: 24.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.white),
                ),
                child: TabBar(
                  indicatorColor: AppColor.transparent,
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.white,
                  controller: tabController,
                  onTap: (value) {
                    _value = value;
                    setState(() {});
                  },
                  tabs: [
                    Container(
                      width: double.infinity.w,
                      margin: EdgeInsets.only(top: 4.w, bottom: 4.w),
                      decoration: BoxDecoration(
                        color: _value == 0
                            ? AppColor.primary
                            : AppColor.transparent,
                      ),
                      child: const Tab(
                        text: 'Upcoming',
                      ),
                    ),
                    Container(
                      width: double.infinity.w,
                      margin: EdgeInsets.only(top: 4.w, bottom: 4.w),
                      decoration: BoxDecoration(
                        color: _value == 1
                            ? AppColor.primary
                            : AppColor.transparent,
                      ),
                      child: const Tab(
                        text: 'Completed',
                      ),
                    ),
                    Container(
                      width: double.infinity.w,
                      margin: EdgeInsets.only(top: 4.w, bottom: 4.w),
                      decoration: BoxDecoration(
                        color: _value == 2
                            ? AppColor.primary
                            : AppColor.transparent,
                      ),
                      child: const Tab(
                        text: 'Cancelled',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 480.h,
                child: TabBarView(controller: tabController, children: const [
                  UpcomingTabScreen(),
                  CompletedTabScreen(),
                  CancelledTabScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
