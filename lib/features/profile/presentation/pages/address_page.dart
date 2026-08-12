import 'package:bazar_group_1/core/components/buttons/large_primary_button.dart';
import 'package:bazar_group_1/core/components/inputs/app_text_form_field.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:bazar_group_1/features/profile/presentation/providers/address_provider.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/address_bar_widget.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/address_type_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

class AddressPage extends ConsumerStatefulWidget {
  const AddressPage({super.key});

  @override
  ConsumerState<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends ConsumerState<AddressPage> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(addressProvider.notifier);
    final state = ref.watch(addressProvider);
    final localization = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: notifier.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      AddressBarWidget(),
                      AppFormTextField(
                        label: localization.locationTitle,
                        placeholder: localization.addressTitlePlaceholder,
                        controller: notifier.titleController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          final title = value?.trim() ?? '';
                          if (title.isEmpty) {
                            return localization.addressTitleRequired;
                          }
                          return null;
                        },
                      ),
                      AppFormTextField(
                        label: localization.address,
                        placeholder: localization.fullAddressPlaceholder,
                        controller: notifier.fullAddressController,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          final address = value?.trim() ?? '';
                          if (address.isEmpty) {
                            return localization.fullAddressRequired;
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          localization.addressTypeLabel,
                          style: AppTextStyles.body14Medium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 16,right: 16),
                        child: SegmentedButton<AddressType>(
                          segments: [
                            ButtonSegment<AddressType>(
                              value: AddressType.home,
                              label: Text(localization.homeAddress),
                              icon: const Icon(Icons.home_outlined),
                            ),
                            ButtonSegment<AddressType>(
                              value: AddressType.office,
                              label: Text(localization.officeAddress),
                              icon: const Icon(Icons.work_outline),
                            ),
                          ],
                          selected: {state.type},
                          onSelectionChanged: (Set<AddressType> selection) {
                            notifier.selectType(selection.first);
                          },
                          showSelectedIcon: false,
                          expandedInsets: EdgeInsets.zero,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                  padding: const EdgeInsets.all( 16),
                  child: LargePrimaryButton(
                    label: localization.saveAddressButton,
                    onPressed: () async {
                      final isValid = await notifier.submit();
                  
                      if (isValid && context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}