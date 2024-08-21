import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

/*
A Notifier when a round starts, in order to prevent the next round starts before the current ends
prevent's animation issues when user tries to move tiles too soon.
*/
class RoundCubit extends Cubit<bool> {
  RoundCubit() : super(true);

  void end() {
    emit(true);
  }

  void begin() {
    emit(false);
  }
}

final roundCubit = Modular.get<RoundCubit>();
