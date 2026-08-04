import 'package:bazar_group_1/core/components/app_bars/app_back_bar.dart';
import 'package:bazar_group_1/features/profile/presentation/providers/location_address_provider.dart';
import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/dragup_detailed_address_widget.dart';
import 'package:bazar_group_1/features/profile/presentation/widgets/location_address_diagram_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPage extends ConsumerStatefulWidget{
  const AddressPage({super.key});
  @override
  ConsumerState<AddressPage> createState() => _AddressPageState();
}
class _AddressPageState extends ConsumerState<AddressPage>
{
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

    final locale = Localizations.localeOf(context);

    ref
        .read(locationAddressProvider.notifier)
        .initializeAddress(locale: locale);
  });
  }
   @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
     final localization = S.of(context);
    final locationState = ref.watch(locationAddressProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBackBar(
         title: localization.locationTitle,
         leadingWidget: const BackButtonIcon(),
         onLeadingPressed: () {},
      ),
      
      body: Stack(
        children: [
          Positioned.fill(
            child: LocationAddressDiagramWidget(
              selectedLocation: locationState.selectedLocation,
              onLocationSelected: (location) {
                ref
                    .read(locationAddressProvider.notifier)
                    .selectLocation(location,locale: locale,);
              },
            ),
          ),
          Positioned.fill(
            child: DragupDetailedAddressWidget(
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
          ),
        ],
      ),
    );
  }
}
