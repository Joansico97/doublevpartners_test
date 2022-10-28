import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_flutter/data/providers/general_providers.dart';
import 'package:prueba_flutter/pages/add_address_page/add_address_page.dart';
import 'package:prueba_flutter/services/auth_service.dart';

import '../../data/models/remote_models/location_model/location_model.dart';
import '../../data/models/remote_models/user_model/user_model.dart';
import '../../pages/home_page/home_page.dart';
import '../../pages/login_page/login_page.dart';
import '../../pages/register_page/register_page.dart';
import '../../services/services.dart';

part './routes_handler.dart';

class GoRouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <GoRoute>[
      GoRoute(
        path: '/login',
        builder: _loginPageBuilder,
      ),
      GoRoute(
        path: '/register',
        builder: _registerPageBuilder,
      ),
      GoRoute(
        path: '/home',
        builder: _homePageBuilder,
      ),
      GoRoute(
        path: '/add',
        builder: _addAddressPageBuilder,
      ),
    ],
  );
}
