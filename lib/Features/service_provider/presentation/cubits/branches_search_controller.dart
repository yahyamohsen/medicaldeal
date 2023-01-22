import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

class BranchesSearchController extends ChangeNotifier {
  List<BranchModel>? allBranches;

  // used to hold the providers search result
  // default value is null
  // when null all providers are displayed
  List<BranchModel>? branchesList;

  List<BranchModel>? get branches => branchesList;

  // when we revieve the data from the api
  // we use this setter to initalize the providers
  set branches(List<BranchModel>? branches) {
    allBranches = [...?branches];
  }

  String? searchText;
  String? get text => searchText;

  // searching for service provider based on text
  void searchBranches(
      {required String text, required List<BranchModel> branches}) {
    branchesList?.clear();
    searchText = text;
    List<BranchModel> resultBranches = [];

    for (var branch in branches) {
      if (getLocalizedData(
              branch.addressEn!.toLowerCase(), branch.addressAr!.toLowerCase())
          .contains(text.toLowerCase())) {
        resultBranches.add(branch);
      }
    }
    branchesList = resultBranches;
    notifyListeners();
  }

  void resetData() {
    searchText = null;
    branchesList = null;
    notifyListeners();
  }
}
