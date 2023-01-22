import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/check%20out/data/models/promo_code_model.dart';

import '../../../../../core/Error/failures.dart';
import '../../../data/repositries/check_out_repo.dart';

part 'validate_promo_code_state.dart';

class ValidatePromoCodeCubit extends Cubit<ValidatePromoCodeState> {
  ValidatePromoCodeCubit(this.checkoutRepo) : super(ValidatePromoCodeInitial());

  final CheckoutRepo checkoutRepo;

  void validatePromoCode(String promoCode) async {
    emit(ValidatePromoCodeLoading());

    var result = await checkoutRepo.validatePromoCode(promoCode);

    result.fold((failure) {
      emit(ValidatePromoCodeFailure(failure.errMessage));
    }, (r) {
      emit(ValidatePromoCodeSuccess(r));
    });
  }
}
