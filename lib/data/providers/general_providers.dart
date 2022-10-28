import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutter/data/models/remote_models/user_model/user_model.dart';

final userLoggedProvider = StateProvider<UserModel>((ref) => UserModel.fromJson({}));
