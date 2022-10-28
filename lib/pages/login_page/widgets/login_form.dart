import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_flutter/core/widgets/input_decorations.dart';
import 'package:prueba_flutter/core/utils/utils.dart';

import '../../../services/app_localization_service.dart';
import '../riverpod/login_page_state.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginPageState);
    final notifier = ref.read(loginPageState.notifier);

    return SizedBox(
      child: Form(
        key: state.formKeyLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              controller: state.emailController,
              decoration: InputDecorations.authInputDecoration(
                hintText: AppLocalizationService.of(context).translate('login_page_text', 'hint_text')!,
                labelText: AppLocalizationService.of(context).translate('login_page_text', 'label_text')!,
                prefixIcon: Icons.alternate_email,
              ),
              validator: (value) => notifier.validateEmail(value),
            ),
            SizedBox(height: size.height(context, .01)),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: state.passwordController,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*********',
                labelText: AppLocalizationService.of(context).translate('login_page_text', 'password_text')!,
                prefixIcon: Icons.lock_outline,
              ),
              validator: (value) => notifier.validatePassword(value),
            ),
            SizedBox(height: size.height(context, .05)),
            InkWell(
              onTap: () => notifier.login(context),
              child: Container(
                padding: size.symmetric(context, .1, .02),
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  borderRadius: size.borderRadius(context, .1),
                ),
                child: Text(
                  AppLocalizationService.of(context).translate('login_page_text', 'btn_text')!,
                  style: styles.boldMedium(
                    color: colors.witheColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
