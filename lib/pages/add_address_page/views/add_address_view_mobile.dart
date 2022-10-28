part of '../add_address_page.dart';

class AddAddressViewMobile extends StatelessWidget {
  const AddAddressViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        // physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height(context, .12)),
            CardContainer(
              child: Column(
                children: [
                  // SizedBox(height: size.height(context, .005)),
                  Text(
                    AppLocalizationService.of(context).translate('add_address_page_text', 'message_text')!,
                    style: styles.headerTwo(
                      color: colors.blackColor,
                    ),
                  ),
                  SizedBox(height: size.height(context, .02)),
                  const AddAddressForm(),
                ],
              ),
            ),
            SizedBox(height: size.height(context, .001)),
          ],
        ),
      ),
    );
  }
}
