// import 'package:golf/utils/Helper.dart';

//   **** URLs *****
const DOMAIN_NAME = 'http://terrace9.uaenorth.cloudapp.azure.com/';

const BASE_URL = '${DOMAIN_NAME}api/jigsaw';

//   **** WebView URLs *****

// ignore_for_file: non_constant_identifier_names
String TERMS_CONDITIONS_URL(language) =>
    '$DOMAIN_NAME$language/web-views/terms';
String PRIVACY_POLICY_URL(language) =>
    '$DOMAIN_NAME$language/web-views/privacy-policy';
String NEWS_URL(language, id) => '$DOMAIN_NAME$language/web-views/news/$id';
String TOURNAMENTS_URL(language) =>
    '$DOMAIN_NAME$language/web-views/tournaments/1';

// **** user data ****
const USER_DATA = 'userData';
const SETTINGS = 'settings';

// ----------------------------------------

//   **** Fonts *****
// H1_FONT() => languageCondition(32.0, 30.0);
// H2_FONT() => languageCondition(24.0, 22.0);
// H3_FONT() => languageCondition(18.0, 16.0);
// H4_FONT() => languageCondition(15.0, 13.0);
// H5_FONT() => languageCondition(12.0, 10.0);
// H6_FONT() => languageCondition(9.0, 7.0);
// HEADER_FONT() => languageCondition(20.0, 18.0);
// BUTTON_FONT() => languageCondition(18.0, 16.0);

// ----------------------------------------

//   **** Colors *****
const PRIMARY_COLOR = 0xFFF6A800;
const SECONDRY_COLOR = 0xFF61BA6E;
const GREEN_COLOR = 0xFF0B8D37;
const WHITE_COLOR = 0xFFFFFFFF;
const WHITE2_COLOR = 0xFFFAFAFA;
const WHITE3_COLOR = 0xFFF3F2F7;
const RED_COLOR = 0xFFFF0000;
const GREY_COLOR = 0xFF707070;
const GREY2_COLOR = 0xFF8F9295;
const GERY3_COLOR = 0xFF7B7B7C;
const GERY4_COLOR = 0xFFF0F0F0;
const GERY5_COLOR = 0xFFD5D4D3;
const TEXT_FIELD_GREY_COLOR = 0xFFF0F4F8;
const LIGHT_GREY_COLOR = 0xFF777779;
const DISABLED_COLOR = 0xFFCBCBCB;
const BLACK_COLOR = 0xFF1D2029;
const BLACK1_COLOR = 0xFF444445;
const BLUE_COLOR = 0xFF311A7E;
const BLUE2_COLOR = 0xFF988DBF;
const PURPLE_COLOR = 0xFF24125F;
const HEADER_COLOR = 0xFF444445;

// ----------------------------------------

//   **** Routes *****
const HOME_ROUTE = '/';
const TEST_ROUTE = '/test';
const VERIFICATION_ROUTE = '/verification';
const COMPLETE_PROFILE_ROUTE = '/completeProfile';
const SIGNUP_ROUTE = '/signup';
const SPLASH_ROUTE = '/splash';
const MY_ACCOUNT_ROUTE = '/myAccountRoute';
const MY_WALLET_ROUTE = '/myWalletRoute';
const MY_ORDER_ROUTE = '/myOrderRoute';
const INVITE_FRIENDS_ROUTE = '/inviteFriendsRoute';
const FIND_US_ROUTE = '/findUsRoute';
const FEED_BACK_ROUTE = '/feedBackRoute';
const RATE_US_ROUTE = '/rateUsRoute';
const DRAWER_ROUTE = '/drawerRoute';
const LANGUAGE_ROUTE = '/language';
const LOG_OUT_ROUTE = '/logout';
const DELIVERY_ROUTE = '/deliveryRoute';
const PICKUP_ROUTE = '/pickupRoute';
const ADD_NEW_ADDRESS_ROUTE = '/addNewAddress';
const SAVE_ON_MAP_ROUTE = '/saveOnMap';
const CATEGORIES_ROUTE = '/categories';

// ----------------------------------------

//   **** Keyboard input types *****
const EMAIL_INPUT_TYPE = 'Email';
const PASSWORD_INPUT_TYPE = 'Password';
const NUMBER_INPUT_TYPE = 'Number';
const TEXT_INPUT_TYPE = 'Text';
const MULTI_LINE = 'MultiLine';

// ----------------------------------------

//   **** Message types *****
const ERROR_MESSAGE = 'error';
const SUCCESS_MESSAGE = 'success';
const WARNING_MESSAGE = 'warning';
const BOTTOM_BAR_ID = 'BottomBar';

// ----------------------------------------

//   **** Storage Keys *****
const LANGUAGE_KEY = 'langage';

// ----------------------------------------

//   **** Languages *****
const ARABIC_VALUE = 'ar';
const ENGLISH_VALUE = 'en';

// ----------------------------------------

//   **** API Methouds *****
const GET_METHOUD = 'get';
const POST_METHOUD = 'post';
const PUT_METHOUD = 'put';
const DELETE_METHOUD = 'delete';

// ----------------------------------------
