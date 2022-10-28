import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_flutter/data/providers/general_providers.dart';

import '../../core/utils/utils.dart';
import 'views/home_view_mobile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userLoggedProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () => context.push('/add'),
        child: const Icon(
          Icons.add_location_alt_outlined,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.fullHeight(context),
          width: size.fullWidth(context),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                return Container(
                  color: Colors.red,
                );
              } else if (constraints.maxWidth >= 650) {
                return Container(
                  color: Colors.blue,
                );
              } else {
                return HomeViewMobile(user: user);
              }
            },
          ),
        ),
      ),
    );
  }
}
