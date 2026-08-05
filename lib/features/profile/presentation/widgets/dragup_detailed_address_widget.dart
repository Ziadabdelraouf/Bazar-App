import 'package:bazar_group_1/core/localization/generated/l10n.dart';
import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

enum SaveAddressType {
  home,
  office,
}

class DragupDetailedAddressWidget extends StatefulWidget {
  const DragupDetailedAddressWidget({
    super.key,
    required this.addressTitle,
    required this.fullAddress,
    required this.isLoading,
    required this.onCurrentLocationPressed,
    required this.onConfirm,
    this.errorMessage,
  });

  final String addressTitle;
  final String fullAddress;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onCurrentLocationPressed;
  final ValueChanged<SaveAddressType> onConfirm;

  @override
  State<DragupDetailedAddressWidget> createState() =>
      _DragupDetailedAddressWidgetState();
}

class _DragupDetailedAddressWidgetState
    extends State<DragupDetailedAddressWidget> {
  SaveAddressType _selectedAddressType = SaveAddressType.home;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final String? addressErrorText = switch (widget.errorMessage) {
      'address_not_found' => localization.addressNotFound,
      'address_unavailable' => localization.addressUnavailable,
      _ => null,
    };

    return DraggableScrollableSheet(
      initialChildSize: 0.52,
      minChildSize: 0.42,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                offset: Offset(0, -2),
                color: Colors.black12,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Detail address title and current-location icon
              Row(
                children: [
                  Expanded(
                    child: Text(
                      localization.detailAddressTitle,
                      style: AppTextStyles.h5,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onCurrentLocationPressed,
                    tooltip: localization.currentLocation,
                    icon: Icon(
                      Icons.my_location_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Selected address information
              if (widget.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (addressErrorText != null)
                Text(
                  addressErrorText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(
                          alpha: 0.08,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on_rounded,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.addressTitle.isNotEmpty
                                ? widget.addressTitle
                                : localization.selectedAddressTitle,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.fullAddress.isNotEmpty
                                ? widget.fullAddress
                                : localization.selectAddressMessage,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 18),

              // Save address section
              Text(
                localization.saveAddressAs,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 14),

              Wrap(
                spacing: 12,
                children: [
                  ChoiceChip(
                    label: Text(localization.homeAddress),
                    selected:
                        _selectedAddressType == SaveAddressType.home,
                    showCheckmark: false,
                    onSelected: (_) {
                      setState(() {
                        _selectedAddressType = SaveAddressType.home;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text(localization.officeAddress),
                    selected:
                        _selectedAddressType == SaveAddressType.office,
                    showCheckmark: false,
                    onSelected: (_) {
                      setState(() {
                        _selectedAddressType = SaveAddressType.office;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // Confirmation button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: widget.fullAddress.isEmpty ||
                          widget.isLoading
                      ? null
                      : () {
                          widget.onConfirm(_selectedAddressType);
                        },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    localization.confirmationButton,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}