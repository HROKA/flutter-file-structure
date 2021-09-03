import '../../utils/Constants.dart';
// ignore_for_file: non_constant_identifier_names

const REQUEST_OTP = '/requestOTP';
const VALIDATE_OTP = '/validateOTP';
const REGISTER = '/registerUser';
const HOME = '/home';
const ADDRESS = '/address';
const MAIN_CATEGORY = '/mainCategory';
const CATEGORY_PRODUCTS = '/categoryProducts';

const USER = '/user';
const UPLOAD_ATTATCHMENT = '/upload-attachment';
const UPDATE_AVATAR = '/user/updateAvatar';

String ADD_NEW_CARD_PAYMENT({
  session_ref,
  expiry_date,
  cardNumber,
  cvv,
  card_holder_name,
  remember_me,
  lang,
}) =>
    '${DOMAIN_NAME}token?session_ref=$session_ref&expiry_date=$expiry_date&card_number=$cardNumber&cvv=$cvv&card_holder_name=$card_holder_name&remember_me=$remember_me&lang=$lang';
String SAVED_CARD_PAYMENT({
  session_ref,
  card_id,
  cvv,
  lang,
}) =>
    '${DOMAIN_NAME}purchase?session_ref=$session_ref&card_id=$card_id&cvv=$cvv&lang=$lang';
