part of '../register_page.dart';

class RegisterViewMobile extends StatelessWidget {
  const RegisterViewMobile({Key? key}) : super(key: key);

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
                    AppLocalizationService.of(context).translate('register_page_text', 'message_text')!,
                    style: styles.headerTwo(
                      color: colors.blackColor,
                    ),
                  ),
                  SizedBox(height: size.height(context, .02)),
                  const RegisterForm(),
                ],
              ),
            ),
            // SizedBox(height: size.height(context, .001)),
            InkWell(
              onTap: () => context.go('/login'),
              child: Text(
                AppLocalizationService.of(context).translate('register_page_text', 'invitation_text')!,
                style: styles.boldMedium(
                  color: colors.blackColor,
                ),
              ),
            ),
            SizedBox(height: size.height(context, .005)),
          ],
        ),
      ),
    );
  }
}
