import 'package:flutter/material.dart';

import 'package:prueba_flutter/core/utils/utils.dart';

import 'purple_box.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.fullWidth(context),
      height: size.fullHeight(context),
      child: Stack(
        children: [
          const PurpleBox(),
          SafeArea(
            child: Container(
              margin: size.top(context, .05),
              width: size.fullWidth(context),
              child: const Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
