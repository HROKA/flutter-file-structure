import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import './index.dart';
import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';

class CarouselSliderC extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  Function onPress;
  List<String> images;

  CarouselSliderC({
    this.onPress,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarouselSliderController>(
      init: carouselSliderController,
      global: false,
      builder: (controller) => Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: DEVICE_HEIGHT * 0.25,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              viewportFraction: 0.9,
              onPageChanged: controller.onPageUpdated,
            ),
            items: images
                .map(
                  (image) => CommonContainer(
                    style: CommonContainerModel(
                      backgroundImage: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRaduis: 15,
                    ),
                  ),
                )
                .toList(),
            carouselController: _carouselController,
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 12.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Color(
                        controller.current == entry.key
                            ? PRIMARY_COLOR
                            : Constants.WHITE_COLOR,
                      )).withOpacity(0.8),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
