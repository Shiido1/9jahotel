import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:ninejahotel/ui/app_asset/app_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                // Image
                Positioned.fill(
                  child: Image.asset(
                    AppImage.map,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(1.0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 60.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColor.primary1,
                                      border:
                                          Border.all(color: AppColor.black)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 4.8.w),
                                  height: 60.h,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 300.h,
                          ),
                          ...[1, 2, 3, 4, 5].map(
                            (o) => Container(
                                margin: EdgeInsets.only(bottom: 20.w),
                                height: 240.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColor.primary1,
                                    border: Border.all(color: AppColor.black))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   decoration: new BoxDecoration(
      //       // image: DecorationImage(
      //       //     image: AssetImage(AppImage.map),
      //       //     alignment: Alignment.topCenter,
      //       //     fit: BoxFit.contain,
      //       //     opacity: .5),
      //       gradient: new LinearGradient(
      //           colors: [
      //         Color.fromARGB(90, 61, 60, 60),
      //         Colors.black,
      //       ],
      //           stops: [
      //         0.1,
      //         2.0
      //       ],
      //           begin: FractionalOffset.topCenter,
      //           end: FractionalOffset.bottomCenter,
      //           tileMode: TileMode.repeated)),
      // child: Image.asset(
      //   AppImage.map,
      //   fit: BoxFit.cover,
      // ),
      // ),
    );
  }
}
