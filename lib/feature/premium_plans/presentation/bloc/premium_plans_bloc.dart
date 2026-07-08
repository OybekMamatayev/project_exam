import 'package:flutter_bloc/flutter_bloc.dart';
import 'premium_plans_event.dart';
import 'premium_plans_state.dart';

class PremiumPlansBloc extends Bloc<PremiumPlansEvent, PremiumPlansState> {
  PremiumPlansBloc() : super(PremiumPlansInitial());
}
