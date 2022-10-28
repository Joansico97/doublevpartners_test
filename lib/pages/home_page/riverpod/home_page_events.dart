part of './home_page_state.dart';

class _HomePageEvents extends StateNotifier<HomePageModelState> {
  _HomePageEvents(this.ref) : super(HomePageModelState.fromJson({}));

  final Ref ref;

  // void setCurrentIndex(int i) {
  //   state.currentIndex = i;
  //   state = HomePageModelState.fromJson(state.toJson());
  // }

  // Widget? changePageView() {
  //   switch (state.currentIndex) {
  //     case 0:
  //       return MapasScreen();
  //     case 1:
  //       return DireccionesScreen();
  //     default:
  //       return MapasScreen();
  //   }
  // }
}
