import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../index.dart';

class SaveOnMap extends StatelessWidget {
  SaveOnMapController controller = SaveOnMapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
      ),
      body: GetBuilder<SaveOnMapController>(
        init: controller,
        global: false,
        builder: (controller) => Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746,
              ),
            ),
            CommonContainer(
              style: ContainerStyles().pickupContainerStyle(),
              child: HorizontalTypography(
                mainAxisAlignment: MainAxisAlignment.start,
                text: 'add_new_address'.tr,
              ),
            ),
            Positioned(
              bottom: DEVICE_HEIGHT * 0.03,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CommonText(
                    text: 'Gaza strip',
                    containerStyle: ContainerStyles().addressContainerStyle(),
                  ),
                  ButtonC(
                    title: 'save'.tr,
                    onPress: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
