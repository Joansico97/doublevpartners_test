part of 'register_page_state.dart';

class _RegisterPageEvents extends StateNotifier<RegisterPageModelState> {
  _RegisterPageEvents(this.ref) : super(RegisterPageModelState());

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

  String? validateUserName(String? input) {
    {
      if (input!.length <= 5) {
        return 'Por favor ingresa un nombre de más de 6 caracteres';
      } else {
        return null;
      }
    }
  }

  String? validateUserLastName(String? input) {
    {
      if (input!.length <= 5) {
        return 'Por favor ingresa un apellido de más de 6 caracteres';
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

  void register(BuildContext context) async {
    if (state.formKeyRegister.currentState!.validate()) {
      final response = await ref
          .read(authServiceProvider)
          .signUp(email: state.emailController.text, password: state.passwordController.text);
      if (response.isEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.emailController.clear();
          state.passwordController.clear();
          context.go('/home');
        });
      }
      final uid = ref.read(authServiceProvider).getCurrentUser();
      await ref.read(databaseServiceProvider).save(document: {
        "id": uid,
        "email": state.emailController.text,
        "name": state.nameController.text,
        "lastName": state.lastNameController.text,
        "locations": [],
      }, table: Constants.userFirebaseRoute);
    }
  }
}
