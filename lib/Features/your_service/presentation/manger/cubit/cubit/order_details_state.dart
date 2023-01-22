part of 'order_details_cubit.dart';

abstract class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsFailure extends OrderDetailsState {
  final String errMessage;

  const OrderDetailsFailure(this.errMessage);
}

class OrderDetailsSuccess extends OrderDetailsState {
  final List<OrderDetailsModel> orderDetails;

  const OrderDetailsSuccess(this.orderDetails);
}
