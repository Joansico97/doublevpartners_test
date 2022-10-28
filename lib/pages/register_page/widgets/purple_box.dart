import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/utils/utils.dart';

class PurpleBox extends StatelessWidget {
  const PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.fullHeight(context),
      height: size.height(context, .4),
      color: colors.primaryColor,
    );
  }
}
