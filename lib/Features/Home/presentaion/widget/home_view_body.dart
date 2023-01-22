import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/Home/presentaion/widget/categories_widget.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import 'home_view_header.dart';
import 'offer_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HomeViewHeader(),
          CategoriesWidget(),
          SpaceBox(
            height: 2,
          ),
          SpaceBox(),
          OffersWidget(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
