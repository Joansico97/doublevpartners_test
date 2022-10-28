import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:prueba_flutter/data/providers/general_providers.dart';
import 'package:prueba_flutter/services/database_service.dart';

import '../../../data/models/remote_models/location_model/location_model.dart';
import '../../../data/models/remote_models/user_model/user_model.dart';

part 'add_address_page_events.dart';
part 'add_address_page_model_state.dart';

final addAddressPageState = StateNotifierProvider<_AddAddressPageEvents, AddAddressPageModelState>((ref) {
  return _AddAddressPageEvents(ref);
});
