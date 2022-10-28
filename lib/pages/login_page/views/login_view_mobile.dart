part of '../login_page.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({Key? key}) : super(key: key);

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
                    AppLocalizationService.of(context).translate('login_page_text', 'message_text')!,
                    style: styles.headerTwo(
                      color: colors.blackColor,
                    ),
                  ),
                  SizedBox(height: size.height(context, .05)),
                  LoginForm(),
                ],
              ),
            ),
            SizedBox(height: size.height(context, .005)),
            InkWell(
              onTap: () => context.push('/register'),
              child: Text(
                AppLocalizationService.of(context).translate('login_page_text', 'invitation_text')!,
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
