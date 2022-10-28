part of './router.dart';

Widget _homePageBuilder(BuildContext context, GoRouterState state) {
  return Consumer(
    builder: (context, ref, child) {
      final user = ref.watch(userLoggedProvider);
      final uid = ref.read(authServiceProvider).getCurrentUser();

      if (uid == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/login');
        });
        return Container();
      } else if (user.id == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(userLoggedProvider.state).update(
                (state) => UserModel(
                  id: uid,
                  email: user.email,
                  name: user.name,
                  lastName: user.lastName,
                  locations: user.locations,
                ),
              );
        });
      }
      return child!;
    },
    child: const HomePage(),
  );
}

Widget _loginPageBuilder(BuildContext context, GoRouterState state) {
  return const LoginScreen();
}

Widget _registerPageBuilder(BuildContext context, GoRouterState state) {
  return const RegisterScreen();
}

Widget _addAddressPageBuilder(BuildContext context, GoRouterState state) {
  return const AddAddressPage();
}
