import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/home_view.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/views/choose_your_lap_view.dart';

class CheckoutViewSuccess extends StatefulWidget {
  const CheckoutViewSuccess({super.key});

  @override
  State<CheckoutViewSuccess> createState() => _CheckoutViewSuccessState();
}

class _CheckoutViewSuccessState extends State<CheckoutViewSuccess> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const HomeView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await onWillPopScrop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.asset('assets/images/success.json'),
        ),
      ),
    );
  }

  Future<bool> onWillPopScrop(context) async {
    return Future.delayed(const Duration(milliseconds: 1), () {
      return false;
    });
  }
}
