import 'package:bazar_group_1/features/profile/presentation/providers/location_address_provider.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/dragup_detailed_address_widget.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/location_address_diagram_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPage extends ConsumerStatefulWidget{
  const AddressPage({super.key});
  @override
  ConsumerState<AddressPage> createState() => AddressPageState();
}
class AddressPageState extends ConsumerState<AddressPage>
{
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locale = Localizations.localeOf(context);
      final initialLocation = ref.read(
        locationAddressProvider.select(
          (state) => state.selectedLocation,
        ),
      );

      ref
          .read(locationAddressProvider.notifier)
          .selectLocation(initialLocation, locale: locale,);
    });
  }
   @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
     final localization = S.of(context);
    final locationState = ref.watch(locationAddressProvider);

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: const BackButton(),
      title: Text(
        S.of(context).locationTitle,
      ),
      centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: LocationAddressDiagramWidget(
              selectedLocation: locationState.selectedLocation,
              onLocationSelected: (location) {
                ref
                    .read(locationAddressProvider.notifier)
                    .selectLocation(location,locale: locale,);
              },
            ),
          ),
          DragupDetailedAddressWidget(
            addressTitle: locationState.addressTitle,
            fullAddress: locationState.fullAddress,
            isLoading: locationState.isLoading,
            errorMessage: locationState.errorMessage,
            onCurrentLocationPressed: () {
            // Add current-location logic later.
          },
          onConfirm: (addressType) {
            debugPrint('Selected address type: $addressType');
            debugPrint('Address: ${locationState.fullAddress}');
          },
          ),
        ],
      ),
    );
  }
}
