import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DashboardState {
  initial,
  loadingShimmer,
}

class DashboardCubit extends Cubit<DashboardState> {
  int selectedIndex = 0;
  bool showShimmer = false;
  bool showSearchBar = false;
  Timer? shimmerTimer;

  DashboardCubit() : super(DashboardState.initial) {
    startLoadingShimmerEffect();
  }

  void selectIndex(int index) {
    selectedIndex = index;
    print('index clicked @!!!!!!!!!');
    emit(DashboardState.initial);
  }

  void startLoadingShimmerEffect() {
    shimmerTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      showShimmer = true;
      emit(DashboardState.loadingShimmer);
    });
    showShimmer = true;
    emit(DashboardState.loadingShimmer);
  }

  void toggleSearchBar() {
    showSearchBar = !showSearchBar;
    print('Clicked');
    emit(DashboardState.initial);
  }

  @override
  Future<void> close() {
    shimmerTimer?.cancel();
    return super.close();
  }
}
