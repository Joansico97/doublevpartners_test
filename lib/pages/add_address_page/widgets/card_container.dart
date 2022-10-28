import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/utils/colors.dart';
import 'package:prueba_flutter/core/utils/size.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: size.symmetric(context, .08, .2),
      child: Container(
        width: size.fullWidth(context),
        padding: size.all(context, .05),
        decoration: BoxDecoration(
          borderRadius: size.borderRadius(context, .05),
          color: colors.witheColor,
          boxShadow: [
            BoxShadow(
              color: colors.blackColor.withOpacity(.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
