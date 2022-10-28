part of 'add_address_page_state.dart';

class _AddAddressPageEvents extends StateNotifier<AddAddressPageModelState> {
  _AddAddressPageEvents(this.ref) : super(AddAddressPageModelState());

  final Ref ref;
  final _logger = Logger();

  String? validateCountry(String? input) {
    {
      if (input!.length <= 1) {
        return 'Por favor ingresa un país de más de 1 caracteres';
      } else {
        return null;
      }
    }
  }

  String? validateCity(String? input) {
    {
      if (input!.length <= 1) {
        return 'Por favor ingresa un país de más de 1 caracteres';
      } else {
        return null;
      }
    }
  }

  String? validateAddress(String? input) {
    {
      if (input!.length <= 1) {
        return 'Por favor ingresa un país de más de 1 caracteres';
      } else {
        return null;
      }
    }
  }

  void addAddress(BuildContext context) async {
    final response = await ref.read(databaseServiceProvider).updateDocument(
          docId: ref.read(userLoggedProvider.state).state.id,
          data: {
            'locations': [
              ...ref.read(userLoggedProvider.state).state.locations!.map((value) => value.toJson()).toList(),
              {
                "country": state.countryController.text,
                "city": state.cityController.text,
                "address": state.addressController.text,
              }
            ],
          },
          table: 'Users',
        );

    if (response.isEmpty) {
      ref.watch(userLoggedProvider.state).update(
            (userState) => UserModel(
              id: userState.id,
              email: userState.email,
              name: userState.name,
              lastName: userState.lastName,
              locations: [
                ...userState.locations!,
                LocationModel.fromJson(
                  {
                    "country": state.countryController.text,
                    "city": state.cityController.text,
                    "address": state.addressController.text,
                  },
                )
              ],
            ),
          );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/home');
      });
    } else {
      //TODO: Show Dialog with error
    }
  }
}
