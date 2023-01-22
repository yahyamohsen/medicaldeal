import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

class ServiceProviderSearchController extends ChangeNotifier {
  List<ServiceProviderModel>? allProviders;

  // used to hold the providers search result
  // default value is null
  // when null all providers are displayed
  List<ServiceProviderModel>? serviceProviders;

  List<ServiceProviderModel>? get providers => serviceProviders;

  // when we revieve the data from the api
  // we use this setter to initalize the providers
  set providers(List<ServiceProviderModel>? providers) {
    allProviders = providers;
  }

  String? searchText;
  String? get text => searchText;

  // searching for service provider based on text
  void searhProviders(
      {required String text, required List<ServiceProviderModel> providers}) {
    serviceProviders?.clear();
    searchText = text;
    List<ServiceProviderModel> services = [];

    for (var provider in providers) {
      if (getLocalizedData(
              provider.titleEn!.toLowerCase(), provider.title!.toLowerCase())
          .contains(text.toLowerCase())) {
        services.add(provider);
      }
    }
    serviceProviders = services;
    notifyListeners();
  }

  void resetData() {
    searchText = null;
    serviceProviders = null;
    notifyListeners();
  }
}
