// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/core/connect_end/model/get_favorite_response_model/datum.dart';
import 'package:ninejahotel/core/connect_end/view_model/favorites_view_model.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../widget/text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  RefreshController? refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: ViewModelBuilder<FavoritesViewModel>.reactive(
          viewModelBuilder: () => locator<FavoritesViewModel>(),
          onViewModelReady: (model) => model.getFavorite(),
          disposeViewModel: false,
          builder: (_, FavoritesViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  TextView(
                    text: 'My Favourites',
                    fontSize: 24.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  if (model.getFavoriteResponseModel != null ||
                      model.favoriteResponseModelList!.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .60,
                      child: SmartRefresher(
                        key: const PageStorageKey('key'),
                        controller: refreshController!,
                        enablePullDown: false,
                        enablePullUp: true,
                        onRefresh: () async {
                          await model.onRefresh();
                          model.getFavorite();
                          refreshController?.refreshCompleted();
                        },
                        onLoading: () async {
                          await model.onLoading();
                          refreshController?.loadComplete();
                        },
                        footer: CustomFooter(builder: ((context, mode) {
                          Widget body;
                          if (model.getFavoriteResponseModel != null &&
                              model.getFavoriteResponseModel!.data!.isEmpty) {
                            body = TextView(
                                text: "You're caught up",
                                color: AppColor.white);
                          } else if (mode == LoadStatus.idle &&
                              model.isLoadNoMore == false) {
                            body = TextView(
                              text: "Pull up load",
                              color: AppColor.white,
                            );
                          } else if (mode == LoadStatus.loading) {
                            body = const CupertinoActivityIndicator(
                              color: AppColor.white,
                            );
                          } else if (mode == LoadStatus.failed) {
                            body = TextView(
                                text: "Load Failed!Click retry!",
                                color: AppColor.white);
                          } else if (mode == LoadStatus.canLoading) {
                            body = TextView(
                                text: "release to load more",
                                color: AppColor.white);
                          } else {
                            body = TextView(
                                text: "You're caught up",
                                color: AppColor.white);
                          }
                          return SizedBox(
                            height: 50.0,
                            child: Center(child: body),
                          );
                        })),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...model.favoriteResponseModelList!.map(
                                (o) => cardFavorite(o: o),
                              ),
                              SizedBox(
                                height: 30.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  else if (model.isLoading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    )
                  else if (model.favoriteResponseModelList!.isEmpty)
                    Center(
                      child: TextView(
                        text: "NO HOTEL",
                        color: AppColor.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  SizedBox(
                    height: 100.h,
                  )
                ],
              ),
            );
          }),
    );
  }

  cardFavorite({Datum? o}) => Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 20.w),
          height: 240.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.primary1,
              border: Border.all(color: AppColor.black)),
        ),
        Image.network(
          o?.image ?? '',
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: 128.0.h,
        ),
        Positioned(
          bottom: 32.0,
          left: 6,
          right: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: o?.name ?? '',
                    fontSize: 21.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.2.w),
                        child: Icon(
                          Icons.location_on_rounded,
                          size: 17.2.sp,
                          color: const Color.fromARGB(255, 106, 165, 165),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SizedBox(
                        width: 168.0.w,
                        child: TextView(
                          text: o?.address ?? '',
                          fontSize: 14.2.sp,
                          maxLines: 2,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...[1, 2, 3, 4].map((o) => Icon(
                            Icons.star,
                            size: 14.sp,
                            color: AppColor.primary,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextView(
                        text: '120 Reviews',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                    text: 'N${o?.onlinePrice ?? ''}',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primary,
                  ),
                  TextView(
                    text: '/Per Night',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ]);
}
