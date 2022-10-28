import 'package:flutter/material.dart';
import 'package:prueba_flutter/data/models/remote_models/user_model/user_model.dart';

import '../../../core/utils/utils.dart';
import '../widgets/widgets.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.fullWidth(context),
      height: size.fullHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HomeAppBar(),
          Container(
            padding: size.all(context, .035),
            margin: size.all(context, .025),
            width: size.fullWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: size.borderRadius(context, .025),
              boxShadow: [
                BoxShadow(
                  color: colors.blackColor.withOpacity(.15),
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '${user.name!} ${user.lastName!}',
                  style: styles.mediumLarge(),
                ),
                SizedBox(height: size.height(context, .01)),
                Text(
                  user.email!,
                  style: styles.mediumLarge(),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height(context, .1)),
          Expanded(
            child: ListView.builder(
              padding: size.symmetric(context, .05, .05),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: user.locations!.length,
              itemBuilder: (context, index) => AddressCard(user: user, index: index),
            ),
          ),
        ],
      ),
    );
  }
}
