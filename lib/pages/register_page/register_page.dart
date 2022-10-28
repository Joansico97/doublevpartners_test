import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../services/app_localization_service.dart';
import '../../core/utils/utils.dart';
import 'riverpod/register_page_state.dart';
import 'widgets/widgets.dart';

part './views/register_view_mobile.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerPageState);
    final notifier = ref.watch(registerPageState.notifier);

    _homeInit(ref: ref);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.fullHeight(context),
          width: size.fullWidth(context),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                //TODO: Hacer desktop and tablet view
                return Container();
              } else {
                return RegisterViewMobile();
              }
            },
          ),
        ),
      ),
    );
  }

  void _homeInit({required WidgetRef ref}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // if (ref.read(homePageState).postList!.isEmpty && !ref.read(homePageState).isDeleted!) {
      //   await ref.read(homePageState.notifier).getAllPosts();
      // }
    });
  }
}
