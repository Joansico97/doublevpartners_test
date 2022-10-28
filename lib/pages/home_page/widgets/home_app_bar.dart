import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutter/data/providers/general_providers.dart';

import 'package:prueba_flutter/services/auth_service.dart';

import '../../../core/utils/utils.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      backgroundColor: colors.primaryColor,
      centerTitle: true,
      title: Text(
        ref.read(userLoggedProvider.state).state.name!,
        style: styles.headerTwo(
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          ref.read(authServiceProvider).signOut();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: colors.witheColor,
        ),
      ),
    );
  }
}
