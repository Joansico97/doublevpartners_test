import 'package:flutter/material.dart';
import 'package:prueba_flutter/data/models/remote_models/user_model/user_model.dart';

import '../../../core/utils/utils.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size.all(context, .035),
      margin: size.bottom(context, .025),
      width: size.fullWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: size.borderRadius(context, .025),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF01003E).withOpacity(.15),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        width: size.width(context, .6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.locations![index].address.toString(),
              style: styles.boldMedium(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .02)),
            Text(
              user.locations![index].country.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: styles.semiboldSmall(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .02)),
            Text(
              user.locations![index].city.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: styles.lightSmall(),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
