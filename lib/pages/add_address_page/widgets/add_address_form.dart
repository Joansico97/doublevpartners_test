import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_flutter/core/widgets/input_decorations.dart';
import 'package:prueba_flutter/core/utils/utils.dart';

import '../../../services/app_localization_service.dart';
import '../riverpod/add_address_page_state.dart';

class AddAddressForm extends ConsumerWidget {
  const AddAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addAddressPageState);
    final notifier = ref.watch(addAddressPageState.notifier);

    return SizedBox(
      child: Form(
        key: state.formKeyAddAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: state.countryController,
              decoration: InputDecorations.authInputDecoration(
                hintText: AppLocalizationService.of(context).translate('add_address_page_text', 'country_text')!,
                labelText: AppLocalizationService.of(context).translate('add_address_page_text', 'country_text')!,
                prefixIcon: Icons.map,
              ),
              validator: (value) => notifier.validateCountry(value),
            ),
            SizedBox(height: size.height(context, .01)),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: state.cityController,
              decoration: InputDecorations.authInputDecoration(
                hintText: AppLocalizationService.of(context).translate('add_address_page_text', 'city_text')!,
                labelText: AppLocalizationService.of(context).translate('add_address_page_text', 'city_text')!,
                prefixIcon: Icons.location_searching_outlined,
              ),
              validator: (value) => notifier.validateCity(value),
            ),
            SizedBox(height: size.height(context, .01)),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: state.addressController,
              decoration: InputDecorations.authInputDecoration(
                hintText: AppLocalizationService.of(context).translate('add_address_page_text', 'address_text')!,
                labelText: AppLocalizationService.of(context).translate('add_address_page_text', 'address_text')!,
                prefixIcon: Icons.location_on_outlined,
              ),
              validator: (value) => notifier.validateAddress(value),
            ),
            SizedBox(height: size.height(context, .05)),
            InkWell(
              onTap: () => notifier.addAddress(context),
              child: Container(
                padding: size.symmetric(context, .2, .02),
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  borderRadius: size.borderRadius(context, .1),
                ),
                child: Text(
                  AppLocalizationService.of(context).translate('add_address_page_text', 'btn_text')!,
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
