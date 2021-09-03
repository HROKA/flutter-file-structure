import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../utils/Constants.dart' as Constants;

renderDraggableSheet(controller) => DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      builder: (BuildContext context, ScrollController scrollController) {
        return CommonContainer(
          style: CommonContainerModel(
            backgroundColor: Constants.WHITE_COLOR,
            topLeftRadius: 25.0,
            topRightRadius: 25.0,
          ),
          child: ListView.builder(
            itemCount: 25,
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.center,
                  child: CommonContainer(
                    style: CommonContainerModel(
                      width: DEVICE_WIDTH * 0.12,
                      height: DEVICE_HEIGHT * 0.006,
                      borderRaduis: 25.0,
                      marginVertical: DEVICE_HEIGHT * 0.02,
                      backgroundColor: Constants.BLACK_COLOR,
                    ),
                  ),
                );
              } else {
                return CommonContainer(
                  style: CommonContainerModel(
                    marginHorizontal: DEVICE_WIDTH * 0.05,
                  ),
                  child: AddressCard(
                    title: "TERRACE N09",
                    address: "طريق الملك عبدالعزيز،, An Nafal, Riyadh 11564",
                  ),
                );
              }
            },
          ),
        );
      },
    );
