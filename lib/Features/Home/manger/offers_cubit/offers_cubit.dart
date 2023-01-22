import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/Home/date/models/offer_model.dart';
import 'package:sart_up_project/Features/Home/date/repo/home_repo.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.homeRepo) : super(OffersInitial());
  final HomeRepo homeRepo;

  fetchOffers() async {
    emit(OffersLoading());

    var result = await homeRepo.fetchOffers();

    result.fold((failure) {
      emit(OffersFailure(failure.errMessage));
    }, (r) {
      emit(OffersSuccess(r));
    });
  }
}
