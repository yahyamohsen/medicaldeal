import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

class SearchController extends ChangeNotifier {
  // a bool that indicates wether the search result is empty or not
  // used to display No result on the ui
  // default value is false
  bool isFilterdProviderSearchResultEmpy = false;

  // a bool that indicates wether the search result is empty or not
  // used to display No result on the ui
  // default value is false
  bool isFilterdSearchResultEmpy = false;

  List<ServiceModel>? allServices;
  List<ServiceProviderModel>? allProviders;

  List<ServiceModel> filterdList = [];

  List<ServiceModel> get services => filterdList;

  List<ServiceProviderModel> filterdProviderList = [];

  List<ServiceProviderModel> get providers => filterdProviderList;

  // text we are searching for
  // we are using this variable to display it on the ui
  String? text;
  void searchServicesData(String text) {
    this.text = text;
    filterdList.clear();
    for (var service in allServices!) {
      var data = getLocalizedData(service.titleEn, service.title);
      if (data.toLowerCase().contains(text.toLowerCase())) {
        filterdList.add(service);
      }
    }
    isFilterdSearchResultEmpy = filterdList.isEmpty ? true : false;
    notifyListeners();
  }

  void searchProviders(String text) {
    this.text = text;

    filterdProviderList.clear();
    for (var service in allProviders!) {
      var data = getLocalizedData(service.titleEn, service.title).toLowerCase();

      if (data.contains(text.toLowerCase())) {
        filterdProviderList.add(service);
      }
    }
    isFilterdProviderSearchResultEmpy =
        filterdProviderList.isEmpty ? true : false;
    notifyListeners();
  }

  void searchProvidersByCategory(String id, String text) {
    this.text = text;

    filterdProviderList.clear();
    for (var service in allProviders!) {
      if (service.categoryId == id) {
        filterdProviderList.add(service);
      }
    }
    isFilterdProviderSearchResultEmpy =
        filterdProviderList.isEmpty ? true : false;
    notifyListeners();
  }

  void resetServicesSearchResult() {
    filterdList = allServices!;
    filterdList.clear();
    allServices!.map((e) {
      filterdList.add(e);
    });
    text = null;
    notifyListeners();
  }

  void resetProviderSerachResult() {
    isFilterdProviderSearchResultEmpy = false;

    filterdProviderList.clear();
    allProviders!.map((e) {
      filterdProviderList.add(e);
    });
    text = null;
    notifyListeners();
  }
}
