import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:sart_up_project/constants.dart';

import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/determine_transtion.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/styles.dart';

import '../../../services/models/doctor_category_model.dart';
import '../view/service_provider_details.dart';
import '../view/service_provider_navigation_view.dart';

class ServiceProviderListViewItem extends StatefulWidget {
  const ServiceProviderListViewItem(
      {Key? key, required this.serviceProviderModel, this.isDoctor = false})
      : super(key: key);

  final ServiceProviderModel serviceProviderModel;
  final bool isDoctor;

  @override
  State<ServiceProviderListViewItem> createState() =>
      _ServiceProviderListViewItemState();
}

class _ServiceProviderListViewItemState
    extends State<ServiceProviderListViewItem> {
  final docotorCategories = {
    '8': DoctorCategoryModel(
      id: '8',
      title: "امراض قلب واوعية دموية",
      enTitle: 'Diseases of the heart and blood vessels',
      image: Assets.iconBloodVassels,
    ),
    '9': DoctorCategoryModel(
        id: '9',
        title: "جراحة اوعية دموية",
        enTitle: 'Vascular surgery',
        image: Assets.iconSurgery),
    '10': DoctorCategoryModel(
      id: '10',
      title: "جراحة قلب وصدر",
      enTitle: 'Cardiothoracic surgery',
      image: Assets.iconSurgery,
    ),
    '11': DoctorCategoryModel(
        id: '11',
        title: "انف واذن وحنجرة",
        enTitle: "Ear, Nose and Throat",
        image: Assets.iconHearing),
    '12': DoctorCategoryModel(
      id: '12',
      title: "جراحة عامة",
      enTitle: "General Surgery",
      image: Assets.iconSurgery,
    ),
    '13': DoctorCategoryModel(
      id: '13',
      title: "طب أطفال",
      enTitle: "Pediatrics",
      image: Assets.iconChild,
    ),
    '14': DoctorCategoryModel(
      id: '14',
      title: "جراحة مسالك بولية",
      enTitle: "Urological Surgery",
      image: Assets.iconSurgery,
    ),
    '15': DoctorCategoryModel(
      id: '15',
      title: "امراض نفسية",
      enTitle: "Psychiatric illness",
      image: Assets.iconPhyactrist,
    ),
    '16': DoctorCategoryModel(
        id: '16',
        title: "طب وجراحة العيون",
        enTitle: "Ophthalmology",
        image: Assets.iconOphthalmolgy),
    '17': DoctorCategoryModel(
        id: '17',
        title: "جلدية تناسلية",
        enTitle: "Genital skin",
        image: Assets.iconSkin),
    '18': DoctorCategoryModel(
        id: '18',
        title: "نساء وتوليد",
        enTitle: "Obstetrics and gynecology",
        image: Assets.iconGyencology),
    '19': DoctorCategoryModel(
        id: '19',
        title: "طب اورام",
        enTitle: "Oncology",
        image: Assets.iconOncologist),
    '20': DoctorCategoryModel(
        id: '20',
        title: "امراض دم",
        enTitle: "blood diseases",
        image: Assets.iconDropOfBlodd),
    '21': DoctorCategoryModel(
      id: '21',
      title: "جهاز هضمي وكبد",
      enTitle: "Digestive system and liver",
      image: Assets.iconStomach,
    ),
    '22': DoctorCategoryModel(
        id: '22',
        title: "حساسية ومناعة",
        enTitle: "sensitivity and immunity",
        image: Assets.iconImmune),
    '23': DoctorCategoryModel(
        id: '23',
        title: "سكر وغدد صماء",
        enTitle: "Diabetes and endocrine glands",
        image: Assets.iconDiabetes),
    '24': DoctorCategoryModel(
        id: '24',
        title: "طب اسنان",
        enTitle: "Dentistry",
        image: Assets.iconDentalCare),
    '25': DoctorCategoryModel(
        id: '25',
        title: "الامراض الصدرية",
        enTitle: "Chest's diseases",
        image: Assets.iconTorso),
    '26': DoctorCategoryModel(
      id: '26',
      title: "جراحة عظام",
      enTitle: "orthopedic surgery",
      image: Assets.iconSurgery,
    ),
    '27': DoctorCategoryModel(
        id: '27',
        title: "باطنة وكلى",
        enTitle: "Inner and kidneys",
        image: Assets.iconKedynes),
    '28': DoctorCategoryModel(
      id: '28',
      title: "باطنة عامة",
      enTitle: "General internal",
      image: Assets.iconInternal,
    ),
    '29': DoctorCategoryModel(
        id: '29',
        title: "طب طبيعي وروماتيزم",
        enTitle: "Natural medicine and rheumatology",
        image: Assets.iconRheumatology),
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ReviewsCubit>(context).getReviews(
          id: widget.serviceProviderModel.id.toString(),
        );
        Get.to(
          ServiceProviderDetailsView(
            serviceProviderModel: widget.serviceProviderModel,
          ),
          transition: determinTranstion(),
          arguments: widget.serviceProviderModel,
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: SizeConfig.defaultSize * 7,
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomCachedImage(
              imageUrl: widget.serviceProviderModel.image,
            ),
          ),
        ),
        subtitle: widget.isDoctor
            ? getText(widget.serviceProviderModel.categoryId, docotorCategories)
            : null,
        title: Text(
          getLocalizedData(widget.serviceProviderModel.titleEn,
              widget.serviceProviderModel.title),
          style: Styles.TapText.copyWith(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  getText(
      String? categoryId, Map<String, DoctorCategoryModel> docotorCategories) {
    var categoryModel = docotorCategories[categoryId];
    return Text(
      getLocalizedData(categoryModel!.enTitle, categoryModel.title),
    );
  }
}

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  final String? imageUrl;

  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: '$kImageUrlPath$imageUrl',
            imageBuilder: (context, imageProvider) {
              return Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    )),
                width: width ?? 100,
                height: height ?? 100,
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                width: width ?? 100,
                height: height ?? 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.black,
                  ),
                ),
              );
            },
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Assets.mokhtabre,
                ),
              ),
            ),
            width: width ?? SizeConfig.defaultSize * 14,
            height: height ?? SizeConfig.defaultSize * 12,
          );
  }
}
