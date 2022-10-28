part of 'login_page_state.dart';

class _LoginPageEvents extends StateNotifier<LoginPageModelState> {
  _LoginPageEvents(this.ref) : super(LoginPageModelState());

  final Ref ref;
  final _logger = Logger();

  String? validateEmail(String? input) {
    {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(input!.trim())) {
        return 'Ingrese un correo electrónico válido';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String? input) {
    {
      if (input!.length <= 5) {
        return 'La contraseña debe ser de más de 6 caracteres';
      } else {
        return null;
      }
    }
  }

  void login(BuildContext context) async {
    if (state.formKeyLogin.currentState!.validate()) {
      final response = await ref
          .read(authServiceProvider)
          .logIn(email: state.emailController.text, password: state.passwordController.text);
      if (response.isEmpty) {
        _logger.wtf('Funcionó la mondá');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.emailController.clear();
          state.passwordController.clear();
          context.go('/home');
        });
      } else {
        _logger.e(response);
      }
    }
  }
}
