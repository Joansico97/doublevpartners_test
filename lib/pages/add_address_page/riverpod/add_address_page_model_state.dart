part of 'add_address_page_state.dart';

class AddAddressPageModelState {
  AddAddressPageModelState();

  final formKeyAddAddress = GlobalKey<FormState>();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
}
