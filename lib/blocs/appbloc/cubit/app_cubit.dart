import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gweiland_flutter_task/domain/entity/app_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial(appmodel: AppModel(appTab: 0, homeFilter: 0)));

  void updateTabs(int index) {
    if (state is AppInitial) {
      final currentState = state as AppInitial;
      emit(AppInitial(appmodel: currentState.appmodel.copyWith(appTab: index)));
    }
  }

  void applyFiler(int option) async {
    if (state is AppInitial) {
      final currentState = state as AppInitial;
      emit(AppInitial(
          appmodel: currentState.appmodel.copyWith(homeFilter: option)));
    }
  }
}
