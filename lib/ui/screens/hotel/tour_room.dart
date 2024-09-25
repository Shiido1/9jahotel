import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ninejahotel/ui/app_asset/app_color.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class TourRoomScreen extends StatelessWidget {
  TourRoomScreen({super.key});

  CarouselSliderController? carouselSliderController =
      CarouselSliderController();

  List<String> imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBIfEn6WH8VdKWGPrlajoydjrGs2VHYfuqQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbILhBpBiCUCChU99lOT7nhyB2ISL9uV2QUQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQipFiK07AHxC1VW3P3uF-ZnqWs3v3qsayWfQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBIfEn6WH8VdKWGPrlajoydjrGs2VHYfuqQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQipFiK07AHxC1VW3P3uF-ZnqWs3v3qsayWfQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBIfEn6WH8VdKWGPrlajoydjrGs2VHYfuqQ&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: CarouselSlider.builder(
          controller: carouselSliderController,
          slideBuilder: (index) {
            return pageViewWidget(
              image: imageList[index],
              context: context,
            );
          },
          slideTransform: const AccordionTransform(),
          slideIndicator: CircularSlideIndicator(
            currentIndicatorColor: AppColor.primary,
            indicatorBackgroundColor: AppColor.white,
            indicatorRadius: 3,
            itemSpacing: 10,
            padding: EdgeInsets.only(bottom: 202.w),
          ),
          itemCount: imageList.length),
    );
  }

  pageViewWidget({context, image}) => Center(
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          cacheKey: image,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColor.white,
            highlightColor: AppColor.grey,
            child: SizedBox(
              height: 100,
              child: SizedBox(
                width: 160,
                child: Card(
                  color: AppColor.lightGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
