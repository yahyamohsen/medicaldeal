import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/required_permssion.dart';

import '../widget/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    requirstLocationPermssion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeViewBody(),
    );
  }
}
