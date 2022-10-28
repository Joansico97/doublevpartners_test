part of 'register_page_state.dart';

class RegisterPageModelState {
  RegisterPageModelState();

  final formKeyRegister = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
}
