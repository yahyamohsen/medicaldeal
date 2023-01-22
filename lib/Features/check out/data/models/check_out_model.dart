import 'package:sart_up_project/Features/check%20out/presentation/widgets/promo_code.dart';

class OrderModel {
  final String userId;
  final String serviceProviderId;
  final List<List<double>> services;
  final String amount;
  final String total;
  final String? promoCodeId;

  OrderModel({
    required this.userId,
    required this.serviceProviderId,
    required this.services,
    required this.amount,
    required this.total,
    this.promoCodeId,
  });
}
