import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:prueba_flutter/core/utils/constants.dart';

import 'package:prueba_flutter/services/auth_service.dart';
import 'package:prueba_flutter/services/database_service.dart';

part 'register_page_events.dart';
part 'register_page_model_state.dart';

final registerPageState = StateNotifierProvider<_RegisterPageEvents, RegisterPageModelState>((ref) {
  return _RegisterPageEvents(ref);
});
