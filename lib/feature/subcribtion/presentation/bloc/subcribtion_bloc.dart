import 'package:flutter_bloc/flutter_bloc.dart';
import 'subcribtion_event.dart';
import 'subcribtion_state.dart';

class SubcribtionBloc extends Bloc<SubcribtionEvent, SubcribtionState> {
  SubcribtionBloc() : super(SubcribtionInitial());
}
