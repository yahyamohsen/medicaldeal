import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/services/models/doctor_category_model.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/styles.dart';

import '../manger/search_controller.dart';

class DoctorCategoriesBottomSheet extends StatefulWidget {
  const DoctorCategoriesBottomSheet(
      {super.key, required this.searchController});

  final SearchController searchController;

  @override
  State<DoctorCategoriesBottomSheet> createState() =>
      _DoctorCategoriesBottomSheetState();
}

class _DoctorCategoriesBottomSheetState
    extends State<DoctorCategoriesBottomSheet> {
  final List<DoctorCategoryModel> doctorCategories = [
    DoctorCategoryModel(
      id: '8',
      title: "امراض قلب واوعية دموية",
      enTitle: 'Diseases of the heart and blood vessels',
      image: Assets.iconBloodVassels,
    ),
    DoctorCategoryModel(
        id: '9',
        title: "جراحة اوعية دموية",
        enTitle: 'Vascular surgery',
        image: Assets.iconSurgery),
    DoctorCategoryModel(
      id: '10',
      title: "جراحة قلب وصدر",
      enTitle: 'Cardiothoracic surgery',
      image: Assets.iconSurgery,
    ),
    DoctorCategoryModel(
        id: '11',
        title: "انف واذن وحنجرة",
        enTitle: "Ear, Nose and Throat",
        image: Assets.iconHearing),
    DoctorCategoryModel(
      id: '12',
      title: "جراحة عامة",
      enTitle: "General Surgery",
      image: Assets.iconSurgery,
    ),
    DoctorCategoryModel(
      id: '13',
      title: "طب أطفال",
      enTitle: "Pediatrics",
      image: Assets.iconChild,
    ),
    DoctorCategoryModel(
      id: '14',
      title: "جراحة مسالك بولية",
      enTitle: "Urological Surgery",
      image: Assets.iconSurgery,
    ),
    DoctorCategoryModel(
      id: '15',
      title: "امراض نفسية",
      enTitle: "Psychiatric illness",
      image: Assets.iconPhyactrist,
    ),
    DoctorCategoryModel(
        id: '16',
        title: "طب وجراحة العيون",
        enTitle: "Ophthalmology",
        image: Assets.iconOphthalmolgy),
    DoctorCategoryModel(
        id: '17',
        title: "جلدية تناسلية",
        enTitle: "Genital skin",
        image: Assets.iconSkin),
    DoctorCategoryModel(
        id: '18',
        title: "نساء وتوليد",
        enTitle: "Obstetrics and gynecology",
        image: Assets.iconGyencology),
    DoctorCategoryModel(
        id: '19',
        title: "طب اورام",
        enTitle: "Oncology",
        image: Assets.iconOncologist),
    DoctorCategoryModel(
        id: '20',
        title: "امراض دم",
        enTitle: "blood diseases",
        image: Assets.iconDropOfBlodd),
    DoctorCategoryModel(
      id: '21',
      title: "جهاز هضمي وكبد",
      enTitle: "Digestive system and liver",
      image: Assets.iconStomach,
    ),
    DoctorCategoryModel(
        id: '22',
        title: "حساسية ومناعة",
        enTitle: "sensitivity and immunity",
        image: Assets.iconImmune),
    DoctorCategoryModel(
        id: '23',
        title: "سكر وغدد صماء",
        enTitle: "Diabetes and endocrine glands",
        image: Assets.iconDiabetes),
    DoctorCategoryModel(
        id: '24',
        title: "طب اسنان",
        enTitle: "Dentistry",
        image: Assets.iconDentalCare),
    DoctorCategoryModel(
        id: '25',
        title: "الامراض الصدرية",
        enTitle: "Chest's diseases",
        image: Assets.iconTorso),
    DoctorCategoryModel(
      id: '26',
      title: "جراحة عظام",
      enTitle: "orthopedic surgery",
      image: Assets.iconSurgery,
    ),
    DoctorCategoryModel(
        id: '27',
        title: "باطنة وكلى",
        enTitle: "Inner and kidneys",
        image: Assets.iconKedynes),
    DoctorCategoryModel(
      id: '28',
      title: "باطنة عامة",
      enTitle: "General internal",
      image: Assets.iconInternal,
    ),
    DoctorCategoryModel(
        id: '29',
        title: "طب طبيعي وروماتيزم",
        enTitle: "Natural medicine and rheumatology",
        image: Assets.iconRheumatology),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: doctorCategories.length,
        itemBuilder: (context, index) {
          return DoctorCategoryItem(
            image: doctorCategories[index].image,
            onTap: () {
              widget.searchController.searchProvidersByCategory(
                  doctorCategories[index].id,
                  getLocalizedData(
                    doctorCategories[index].enTitle,
                    doctorCategories[index].title,
                  ));
              Get.back();
            },
            text: isEnglish()
                ? doctorCategories[index].enTitle
                : doctorCategories[index].title,
          );
        },
      ),
    );
  }
}

class DoctorCategoryItem extends StatelessWidget {
  const DoctorCategoryItem(
      {super.key, required this.text, this.onTap, required this.image});

  final String text;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        trailing: SizedBox(
          height: 24,
          child: Image.asset(image),
        ),
        title: Text(
          text,
          style: Styles.bodyText1.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
