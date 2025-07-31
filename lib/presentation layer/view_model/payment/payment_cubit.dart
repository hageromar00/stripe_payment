import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/domain%20layer/check_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.repo) : super(PaymentInitial());
  final CheckRepo repo;
  Future givePayment(PaymentIntentInputModel pay) async {
    emit(PaymentLoad());
    var data = await repo.makepay(payment: pay);
    data.fold((l) => emit(PaymentFail(errMessage: l.error)),
        (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    print(change.toString());
    super.onChange(change);
  }
}
