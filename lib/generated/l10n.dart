// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `We`
  String get we {
    return Intl.message(
      'We',
      name: 'we',
      desc: '',
      args: [],
    );
  }

  /// `Care`
  String get care {
    return Intl.message(
      'Care',
      name: 'care',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Log In To Your Account`
  String get log_in_to_your_account {
    return Intl.message(
      'Log In To Your Account',
      name: 'log_in_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Or Use`
  String get or_use {
    return Intl.message(
      'Or Use',
      name: 'or_use',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Apple ID`
  String get apple_id {
    return Intl.message(
      'Apple ID',
      name: 'apple_id',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone`
  String get your_email_or_mobile_phone {
    return Intl.message(
      'Mobile Phone',
      name: 'your_email_or_mobile_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your mobile`
  String get enter_your_email_or_mobile {
    return Intl.message(
      'Enter Your mobile',
      name: 'enter_your_email_or_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enter_your_password {
    return Intl.message(
      'Enter Your Password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password_text {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get log_in {
    return Intl.message(
      'Log In',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get do_not_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get create_your_account {
    return Intl.message(
      'Create Your Account',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get already_have_account {
    return Intl.message(
      'Already have an account',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password_title {
    return Intl.message(
      'Forget Password',
      name: 'forget_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Verify Account`
  String get verify_account {
    return Intl.message(
      'Verify Account',
      name: 'verify_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter below The 4 digits code`
  String get enter_digits_code {
    return Intl.message(
      'Enter below The 4 digits code',
      name: 'enter_digits_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// ` seconds You Can `
  String get seconds_you_can {
    return Intl.message(
      ' seconds You Can ',
      name: 'seconds_you_can',
      desc: '',
      args: [],
    );
  }

  /// `Within `
  String get Within {
    return Intl.message(
      'Within ',
      name: 'Within',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle`
  String get subTitle {
    return Intl.message(
      'Subtitle',
      name: 'subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobile_number {
    return Intl.message(
      'Mobile Number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Name On Card`
  String get name_on_card {
    return Intl.message(
      'Name On Card',
      name: 'name_on_card',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get card_number {
    return Intl.message(
      'Card Number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us Info`
  String get contact_us_info {
    return Intl.message(
      'Contact Us Info',
      name: 'contact_us_info',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Expire Date`
  String get expired_date {
    return Intl.message(
      'Expire Date',
      name: 'expired_date',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get card_holder {
    return Intl.message(
      'Card Holder',
      name: 'card_holder',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Basic Info`
  String get basic_info {
    return Intl.message(
      'Basic Info',
      name: 'basic_info',
      desc: '',
      args: [],
    );
  }

  /// `Medical Info`
  String get medical_info {
    return Intl.message(
      'Medical Info',
      name: 'medical_info',
      desc: '',
      args: [],
    );
  }

  /// `Your Services`
  String get your_services {
    return Intl.message(
      'Your Services',
      name: 'your_services',
      desc: '',
      args: [],
    );
  }

  /// `Service Provider`
  String get service_privder {
    return Intl.message(
      'Service Provider',
      name: 'service_privder',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get your_profile {
    return Intl.message(
      'Your Profile',
      name: 'your_profile',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificaitons {
    return Intl.message(
      'Notifications',
      name: 'notificaitons',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Offers`
  String get doctor_offers {
    return Intl.message(
      'Doctor Offers',
      name: 'doctor_offers',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Complete Profile`
  String get complete_profile {
    return Intl.message(
      'Complete Profile',
      name: 'complete_profile',
      desc: '',
      args: [],
    );
  }

  /// `Selected Services`
  String get selected_services {
    return Intl.message(
      'Selected Services',
      name: 'selected_services',
      desc: '',
      args: [],
    );
  }

  /// `Lap List`
  String get lap_list {
    return Intl.message(
      'Lap List',
      name: 'lap_list',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message(
      'Continue',
      name: 'continues',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `You have selected this service`
  String get you_have_selected_this_services {
    return Intl.message(
      'You have selected this service',
      name: 'you_have_selected_this_services',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Services`
  String get select_your_services {
    return Intl.message(
      'Select Your Services',
      name: 'select_your_services',
      desc: '',
      args: [],
    );
  }

  /// `Our Branches`
  String get our_branches {
    return Intl.message(
      'Our Branches',
      name: 'our_branches',
      desc: '',
      args: [],
    );
  }

  /// `Alex Branch`
  String get alex_branch {
    return Intl.message(
      'Alex Branch',
      name: 'alex_branch',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `WebSite`
  String get website {
    return Intl.message(
      'WebSite',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Search For Branch`
  String get search_for_branch {
    return Intl.message(
      'Search For Branch',
      name: 'search_for_branch',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Lap Name`
  String get lab_name {
    return Intl.message(
      'Lap Name',
      name: 'lab_name',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get service_type {
    return Intl.message(
      'Service Type',
      name: 'service_type',
      desc: '',
      args: [],
    );
  }

  /// `Write your view`
  String get write_your_view {
    return Intl.message(
      'Write your view',
      name: 'write_your_view',
      desc: '',
      args: [],
    );
  }

  /// `What do you need`
  String get what_do_you_need {
    return Intl.message(
      'What do you need',
      name: 'what_do_you_need',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get hospital {
    return Intl.message(
      'Hospital',
      name: 'hospital',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Radiology`
  String get radiology {
    return Intl.message(
      'Radiology',
      name: 'radiology',
      desc: '',
      args: [],
    );
  }

  /// `Lap`
  String get lap {
    return Intl.message(
      'Lap',
      name: 'lap',
      desc: '',
      args: [],
    );
  }

  /// `Physical Therpay`
  String get physical_therpay {
    return Intl.message(
      'Physical Therpay',
      name: 'physical_therpay',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Have a good day`
  String get have_a_good_day {
    return Intl.message(
      'Have a good day',
      name: 'have_a_good_day',
      desc: '',
      args: [],
    );
  }

  /// `Get`
  String get get {
    return Intl.message(
      'Get',
      name: 'get',
      desc: '',
      args: [],
    );
  }

  /// `Check Updates`
  String get check_update {
    return Intl.message(
      'Check Updates',
      name: 'check_update',
      desc: '',
      args: [],
    );
  }

  /// `Get offers now`
  String get get_offers_now {
    return Intl.message(
      'Get offers now',
      name: 'get_offers_now',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get no_internet_connection {
    return Intl.message(
      'Please check your internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get field_is_required {
    return Intl.message(
      'Field is required',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Failed To Pick Image`
  String get failed_to_pick_image {
    return Intl.message(
      'Failed To Pick Image',
      name: 'failed_to_pick_image',
      desc: '',
      args: [],
    );
  }

  /// `Picked Image Successfully`
  String get picked_image_successfully {
    return Intl.message(
      'Picked Image Successfully',
      name: 'picked_image_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose an Image`
  String get please_choose_image {
    return Intl.message(
      'Please Choose an Image',
      name: 'please_choose_image',
      desc: '',
      args: [],
    );
  }

  /// `Change Mobile number`
  String get change_phone_number {
    return Intl.message(
      'Change Mobile number',
      name: 'change_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Current Mobile number`
  String get current_phone_number {
    return Intl.message(
      'Current Mobile number',
      name: 'current_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Type your description`
  String get type_your_description {
    return Intl.message(
      'Type your description',
      name: 'type_your_description',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get upload_image {
    return Intl.message(
      'Upload Image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully`
  String get order_places_successfully {
    return Intl.message(
      'Order placed successfully',
      name: 'order_places_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get add_review {
    return Intl.message(
      'Add Review',
      name: 'add_review',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get your_review {
    return Intl.message(
      'Write your review',
      name: 'your_review',
      desc: '',
      args: [],
    );
  }

  /// `Review added successfully`
  String get review_added_successfully {
    return Intl.message(
      'Review added successfully',
      name: 'review_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `search for nearest medical service`
  String get search_for_nearest_medical_service {
    return Intl.message(
      'search for nearest medical service',
      name: 'search_for_nearest_medical_service',
      desc: '',
      args: [],
    );
  }

  /// `Compare Price`
  String get compar_price {
    return Intl.message(
      'Compare Price',
      name: 'compar_price',
      desc: '',
      args: [],
    );
  }

  /// `Choose your Lap`
  String get choose_your_lap {
    return Intl.message(
      'Choose your Lap',
      name: 'choose_your_lap',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map_view {
    return Intl.message(
      'Map',
      name: 'map_view',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list_view {
    return Intl.message(
      'List',
      name: 'list_view',
      desc: '',
      args: [],
    );
  }

  /// `Check View`
  String get check_box_view {
    return Intl.message(
      'Check View',
      name: 'check_box_view',
      desc: '',
      args: [],
    );
  }

  /// `Offer Details`
  String get offer_details {
    return Intl.message(
      'Offer Details',
      name: 'offer_details',
      desc: '',
      args: [],
    );
  }

  /// `Please at least choose one service`
  String get please_choose_at_least_one_service {
    return Intl.message(
      'Please at least choose one service',
      name: 'please_choose_at_least_one_service',
      desc: '',
      args: [],
    );
  }

  /// `All selected items`
  String get alle_selected_items {
    return Intl.message(
      'All selected items',
      name: 'alle_selected_items',
      desc: '',
      args: [],
    );
  }

  /// `Order was canceld successfully`
  String get order_deleted_successfully {
    return Intl.message(
      'Order was canceld successfully',
      name: 'order_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total_price {
    return Intl.message(
      'Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Password length should be more than 6 char`
  String get password_validation_error {
    return Intl.message(
      'Password length should be more than 6 char',
      name: 'password_validation_error',
      desc: '',
      args: [],
    );
  }

  /// `Icorrect phone number`
  String get phone_number_validatioin_error {
    return Intl.message(
      'Icorrect phone number',
      name: 'phone_number_validatioin_error',
      desc: '',
      args: [],
    );
  }

  /// `PromoCode applied`
  String get promo_code_applied {
    return Intl.message(
      'PromoCode applied',
      name: 'promo_code_applied',
      desc: '',
      args: [],
    );
  }

  /// `Order cannot be deleted`
  String get order_cannot_be_deleted {
    return Intl.message(
      'Order cannot be deleted',
      name: 'order_cannot_be_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Notification deleted successfully`
  String get notification_deleted_successfullty {
    return Intl.message(
      'Notification deleted successfully',
      name: 'notification_deleted_successfullty',
      desc: '',
      args: [],
    );
  }

  /// `There is no reviews`
  String get there_is_no_reviews {
    return Intl.message(
      'There is no reviews',
      name: 'there_is_no_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Scan offer`
  String get scan_offer {
    return Intl.message(
      'Scan offer',
      name: 'scan_offer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
