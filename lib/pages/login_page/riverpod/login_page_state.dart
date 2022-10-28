import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'package:prueba_flutter/services/auth_service.dart';

part 'login_page_events.dart';
part 'login_page_model_state.dart';

final loginPageState = StateNotifierProvider<_LoginPageEvents, LoginPageModelState>((ref) {
  return _LoginPageEvents(ref);
});
