import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/verfiy_order_cubit.dart/verify_order_cubit.dart';
import 'package:sart_up_project/core/network/network_info.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class ScanOffer extends StatelessWidget {
  const ScanOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const QrCodeScanner();
            }));
          },
          child: Text(
            S.of(context).scan_offer,
            style: Styles.bodyText1.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  late final MobileScannerController mobileScannerController;

  @override
  void initState() {
    mobileScannerController =
        MobileScannerController(facing: CameraFacing.back);
    super.initState();
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  bool isBlocTriggered = false;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      allowDuplicates: true,
      controller: MobileScannerController(facing: CameraFacing.back),
      onDetect: (barcode, args) {
        if (!isBlocTriggered) {
          isBlocTriggered = true;
          log(barcode.rawValue!);
          var data = jsonDecode(barcode.rawValue!);
          log(data.runtimeType.toString());
          var userId = data['user_id'];
          var orderId = data['order_id'];
          BlocProvider.of<VerifyOrderCubit>(context).verfiyOrder(
            userId: userId,
            orderId: orderId,
          );
          Get.back();
        }
      },
    );
  }
}
