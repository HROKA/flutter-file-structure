import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../components/index.dart';
import '../../index.dart';
import '../../utils/Constants.dart' as Constants;

class TestScreen extends StatelessWidget {
  List catItems = [
    {'id': 1, 'name': 'first', 'icon': '..'},
    {'id': 2, 'name': 'second', 'icon': '..'},
    {'id': 3, 'name': 'third', 'icon': '..'},
    {'id': 4, 'name': 'forth', 'icon': '..'},
    {'id': 5, 'name': 'fifth', 'icon': '..'},
    {'id': 6, 'name': 'sixth', 'icon': '..'},
  ];
  final CountdownController countdownController = new CountdownController();
  CategoryController _categoryController = CategoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // *** Free Header lol ***
      // appBar: Header(),

      // *** logo and back Header ***
      // appBar: Header(
      //   withLogo: true,
      // ),

      // *** Home Header  ***
      appBar: Header(
        withLogo: true,
        withNotification: true,
        withDrawer: true,
        withBag: true,
      ),

      // *** Bag Header ***
      // appBar: Header(
      //   withLogo: true,
      //   withBag: true,
      // ),

      // *** Title and delete Header ***
      // appBar: Header(
      //   title: 'Cart',
      //   withDelete: true,
      // ),

      // ***drawer and bag Header ***
      // appBar: Header(
      //   withDrawer: true,
      //   withBag: true,
      //   withLogo: true,
      // ),

      // ***title and delete Header ***
      // appBar: Header(
      //   withDelete: true,
      //   title: 'Order No.634-089',
      // ),

      // ***drawer and logo Header ***
      // appBar: Header(
      //   withDrawer: true,
      //   withLogo: true,
      // ),

      // body: DraggableScrollableSheet(
      //   initialChildSize: 0.3,
      //   minChildSize: 0.3,
      //   builder: (BuildContext context, ScrollController scrollController) {
      //     return CommonContainer(
      //       style: CommonContainerModel(
      //         backgroundColor: BLUE2_COLOR,
      //         topLeftRadius: 25.0,
      //         topRightRadius: 25.0,
      //       ),
      //       child: ListView.builder(
      //         itemCount: 25,
      //         controller: scrollController,
      //         itemBuilder: (BuildContext context, int index) {
      //           if (index == 0) {
      //             return Align(
      //               alignment: Alignment.center,
      //               child: CommonContainer(
      //                 style: CommonContainerModel(
      //                   width: DEVICE_WIDTH * 0.12,
      //                   height: DEVICE_HEIGHT * 0.006,
      //                   borderRaduis: 25.0,
      //                   marginVertical: DEVICE_HEIGHT * 0.02,
      //                   backgroundColor: Constants.BLACK_COLOR,
      //                 ),
      //               ),
      //             );
      //           } else {
      //             return CommonContainer(
      //               style: CommonContainerModel(
      //                 marginHorizontal: DEVICE_WIDTH * 0.02,
      //               ),
      //               child: AddressCard(
      //                 isDelivery: true,
      //                 title: "My Home",
      //                 address: "Ar Rafiah, Riyadh 11564",
      //               ),
      //             );
      //           }
      //         },
      //       ),
      //     );
      //   },
      // ),

      body: CommonContainer(
        style: CommonContainerModel(
          alignment: Alignment.center,
          paddingVertical: 35,
          marginHorizontal: 16.0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonContainer(
                style: CommonContainerModel(
                  height: 200,
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.4746,
                  ),
                ),
              ),
              ProductCard(
                title: "Grand Chicken Burger",
                description:
                    "crispy Halal chicken patty topped with a handful of crispy lettuce.",
                price: "26.00",
              ),
              CommonContainer(
                style: CommonContainerModel(
                  margin: 10.0,
                ),
                child: Column(
                  children: [
                    //////Pick up card
                    AddressCard(
                      title: "TERRACE N09",
                      address: "طريق الملك عبدالعزيز،, An Nafal, Riyadh 11564",
                    ),

                    ////////Delivery card
                    AddressCard(
                      isDelivery: true,
                      title: "My Home",
                      address: "Ar Rafiah, Riyadh 11564",
                    ),

                    ///////track order card
                    AddressCard(
                      istarking: true,
                      title: "234-888",
                      orderMethod: "Delivery",
                      date: " 14 Feb, 2021",
                      time: " 10:00 pm",
                    ),
                  ],
                ),
              ),
              CategoryCard(
                title: 'Pick Up',
                subTitle: 'Find More',
                image:
                    'https://media.discordapp.net/attachments/805735809809383444/872008246204977172/1474395998-ghk-0216-comfortfoodcover-meatballs.png',
                onPress: () {
                  print('Pick up card pressed');
                },
              ),
              CarouselSliderC(
                images: [
                  'https://media.discordapp.net/attachments/805735809809383444/872008165800173608/varied-food-carbohydrates-protein-vegetables-fruits-dairy-legumes-on-picture-id1218254547.png',
                  'https://media.discordapp.net/attachments/805735809809383444/872008246204977172/1474395998-ghk-0216-comfortfoodcover-meatballs.png',
                  'https://media.discordapp.net/attachments/805735809809383444/872008394423279676/fideos-secos-tacos-FT-RECIPE0420-1.png'
                ],
              ),
              Category(
                controller: _categoryController,
              ),
              ButtonC(
                // you can add style or let it null
                title: 'Sign up',
              ),
              ButtonC(
                style: ButtonCStyles().buttonIconStyle(),
                child: CommonText(
                  containerStyle: CommonContainerModel(
                    backgroundColor: TRANSPARENT_COLOR,
                    paddingTop: DEVICE_HEIGHT * 0.01,
                  ),
                  text: 'Add new Address',
                  leftChild: CommonContainer(
                    style: CommonContainerModel(
                      marginHorizontal: 2,
                    ),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                  ),
                  style: CommonTextStyles().h2Style(),
                ),
              ),
              ButtonC(
                style: ButtonCStyles().cardButtonStyle(),
                child: CommonText(
                  containerStyle: CommonContainerModel(
                    backgroundColor: TRANSPARENT_COLOR,
                    paddingTop: DEVICE_HEIGHT * 0.015,
                  ),
                  text: '36.00 SAR',
                  rightChild: Icon(
                    Icons.card_giftcard,
                    color: Colors.black,
                  ),
                  style: CommonTextStyles().h3Style(),
                ),
              ),
              ButtonC(
                style: ButtonCStyles().orderButtonStyle(),
                title: 'View',
                titleStyle: CommonTextStyles().h3Style(),
              ),
              ButtonC(
                style: ButtonCStyles().orderCancelButtonStyle(),
                title: 'Cancel',
                titleStyle: CommonTextStyles().h3Style(),
              ),
              ButtonC(
                style: ButtonCStyles().walletButtonStyle(),
                title: 'Cancel',
                titleStyle: CommonTextStyles().h3Style().copyWith(
                      fontColor: Constants.WHITE_COLOR,
                    ),
              ),
              TextInputC(
                textInputController: TextInputController(),
                hint: 'Full name',
                marginTop: 30,
                isRequired: true,
                prefixIcon: LEFT_ARROW,
              ),
              TextInputC(
                edgeText: 'apply'.tr,
                underlinededgeText: true,
                withBorderSide: false,
                fillColor: TEXT_FIELD_GREY_COLOR,
                marginBottom: 30.0,
                radius: 8.0,
                isRequired: false,
                onEdgeTextPress: () {
                  print('onedgeTextPress');
                },
                marginTop: 23.0,
                hint: 'enter_promo_code'.tr,
                textInputController: TextInputController(),
              ),
              TextInputC(
                textInputController: TextInputController(),
                hint: 'Phone number',
                isRequired: true,
                underlineColor: Constants.BLACK_COLOR,
                underlineThikness: 1.0,
                marginBottom: 16.0,
                inputType: NUMBER_INPUT_TYPE,
                withDoneIcon: true,
                maxLenght: 12,
                underlined: true,
                prefixIcon: PHONE_ICON,
              ),
              TextInputC(
                textInputController: TextInputController(),
                headerHint: 'Address name',
                underlineColor: Constants.BLUE2_COLOR,
                underlineThikness: 3.0,
                marginBottom: 16.0,
                isRequired: false,
                marginTop: 16.0,
                withHintAbove: true,
                withDoneIcon: true,
                underlined: true,
              ),
              HorizontalTypography(
                child: Row(
                  children: [
                    CommonText(
                      style: TypographyStyles().boldTypography(),
                      text: 'Welcome to',
                    ),
                    SizedBox(
                      width: DEVICE_WIDTH * 0.01,
                    ),
                    CommonText(
                      style: CommonTextStyles().h3Style().copyWith(
                            fontColor: Constants.BLUE_COLOR,
                          ),
                      text: 'terrace N09',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              HorizontalTypography(text: "Beautiful OTP input ^-^"),
              SizedBox(height: 16),
              OTPInput(
                onChange: (value) {
                  // controller.onOTPChange(value);
                },
              ),
              SizedBox(height: 16),
              TimerC(
                seconds: 10,
                controller: CountdownController(),
                onTimerFinish: () {
                  // controller.changeFinishStatus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
