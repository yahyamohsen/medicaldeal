import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/register_cubit/register_cubit_cubit.dart';
import 'package:sart_up_project/Features/Auth/repositories/auth_repo_impl.dart';
import 'package:sart_up_project/Features/Home/date/repo/home_repo.dart';
import 'package:sart_up_project/Features/Home/manger/offers_cubit/offers_cubit.dart';
import 'package:sart_up_project/Features/Notification/data/repo/notifications_repo_impl.dart';
import 'package:sart_up_project/Features/Notification/presentation/manger/cubit/delete_notification_cubit.dart';
import 'package:sart_up_project/Features/Notification/presentation/manger/cubit/notification_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/EditProfile/edit_profile_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change%20password/change_password_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change_phone/change_phone_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/sign_out/sign_out_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/verfiy_order_cubit.dart/verify_order_cubit.dart';
import 'package:sart_up_project/Features/Profile/repositories/profile_repo_impl.dart';
import 'package:sart_up_project/Features/check%20out/data/repositries/check_out_repo_impl.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/checkout_cubit.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/validate_promo_code_cubit.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/manger/cubit/compare_cubit.dart';
import 'package:sart_up_project/Features/contact_us/presentation/cubits/cubit/contact_us_cubit.dart';
import 'package:sart_up_project/Features/contact_us/repositries/contact_use_repo_impl.dart';
import 'package:sart_up_project/Features/google_map/data/repositries/google_places_repo.dart';
import 'package:sart_up_project/Features/google_map/data/repositries/google_places_repo_impl.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/Features/select_language/presentation/manger/lanugae_cubit/language_cubit.dart';
import 'package:sart_up_project/Features/select_language/presentation/views/select_language_view.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/add_review_vubit/add_review_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/branches_cubit/branches_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_cubit/service_provider_cubit.dart';
import 'package:sart_up_project/Features/service_provider/repositries/service_provider_repo_impl.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/add_pharmacy_order_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/services_cubit/services_cubit.dart';
import 'package:sart_up_project/Features/services/respositiries/services_repo_impl.dart';
import 'package:sart_up_project/Features/splash_view/presentaion/splash_view.dart';
import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';
import 'package:sart_up_project/Features/your_service/data/repo/user_services_repo.dart';
import 'package:sart_up_project/Features/your_service/data/repo/user_services_repo_impl.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/cubit/order_details_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/delete_order_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/user_services_cubit.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/cubits/location_cubit/location_cubit.dart';
import 'package:sart_up_project/core/network/network_info.dart';
import 'package:sart_up_project/core/utils/api.dart';

import 'Features/Home/date/repo/home_repo_impl.dart';
import 'core/singleton/shared_prefrence_singleton.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializing the shared preference singleton
  await Prefs.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const WeCare());
}

class WeCare extends StatelessWidget {
  const WeCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectedServicesCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              AuthRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => OffersCubit(
              HomeRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            )..fetchOffers(),
          ),
          BlocProvider(
            create: (context) => RegisterCubitCubit(
              AuthRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ChangePasswordCubit(
              ProfileRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => EditProfileCubit(
              ProfileRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => UserServicesCubit(
              UserServicesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => DeleteOrderCubit(
              UserServicesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ChangePhoneCubit(
              ProfileRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => SignOutCubit(
              ProfileRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ContactUsCubit(
              ContactUsRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => BranchesCubit(
              ServiceProviderRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ServicesCubit(
              ServicesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ServiceProviderCubit(
              ServiceProviderRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ReviewsCubit(
              ServiceProviderRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => AddReviewCubit(
              ServiceProviderRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => PlacesCubit(
              GooglePlacesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => CheckoutCubit(
              CheckoutRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => OrderDetailsCubit(
              UserServicesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => NotificationCubit(
              NotificationRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => DeleteNotificationCubit(
              NotificationRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => AddPharmacyOrderCubit(
              ServicesRepoImpl(
                Api(
                  NetWrokInfo(
                    Connectivity(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => CompareCubit(),
          ),
          BlocProvider(
            create: (context) => VerifyOrderCubit(
                ProfileRepoImpl(Api(NetWrokInfo(Connectivity())))),
          ),
          BlocProvider(
            create: (context) => LanguageCubit(),
          ),
          BlocProvider(
            create: (context) => LocationCubit(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          locale: getLocale(),
          home: const SplashView(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ));
  }

  getLocale() {
    if (Prefs.prefs.containsKey(kLanguageCode)) {
      return Locale(Prefs.prefs.getString(kLanguageCode)!);
    }

    return const Locale('en');
  }
}
