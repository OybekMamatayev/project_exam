class Pages {
  Pages._();
  static const String logininemail = '/login_in_email';
  static const String signup = '/sign_up';
  static const String logininpassword = '/login_in_password';
  static const String verifycode = '/verify_code';
  static const String forgotpassword = '/forgot_password';
  static const String genrepercenseScreen = '/genre_percenseScreen';
  static const String setpassword = '/set_password';
  static const String homescreen = '/home_screen';
  static const String mainscreen = '/main_screen';
  static const String detailscreen = '/detail_screen';
  static const String mylibrary = '/mylibrary_screen';
  static const String audioplayer = 'audio_player';
  static const String explorescreen = '/explore_screen';
  static const String account = 'account_screen';
  static const String payment = 'payment_screen';
  static const String profiledetails = 'prodile_details_screen';
  static const String productscreen = 'product_screen';
  static const String addpayment = 'addpayment_screen';
  static const String productscreenFull = '$explorescreen/$productscreen';
  static const String audioplayerFull = '$detailscreen/$audioplayer';
  // Profile
  static const String accountFull = '$homescreen/$account';
  static const String profiledetailsFull = '$accountFull/$profiledetails';
  static const String paymentFull = '$accountFull/$payment';
    static const String addpaymentFull = '$paymentFull/$addpayment';

}
