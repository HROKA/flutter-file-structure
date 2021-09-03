import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../index.dart';

class PickupScreen extends StatelessWidget {
  PickupController controller = PickupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
      ),
      body: GetBuilder<PickupController>(
        init: controller,
        global: false,
        builder: (controller) => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746,
              ),
            ),
            CommonContainer(
              style: ContainerStyles().pickupContainerStyle(),
              child: HorizontalTypography(
                mainAxisAlignment: MainAxisAlignment.start,
                text: 'pick_up'.tr,
              ),
            ),
            renderDraggableSheet(controller),
          ],
        ),
      ),
    );
  }
}
