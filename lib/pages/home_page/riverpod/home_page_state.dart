import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './home_page_events.dart';
part './home_page_model_state.dart';

final homePageState = StateNotifierProvider<_HomePageEvents, HomePageModelState>((ref) {
  return _HomePageEvents(ref);
});
