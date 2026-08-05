import 'package:bazar_group_1/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddressBarWidget extends StatelessWidget {
  const AddressBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16 ,top: 25),
      child: Row(
        children: [
          Icon(Icons.arrow_back , size: 24 ),
          Padding(
            padding: const EdgeInsets.only(left: 88),
            child: Text("Location",style: AppTextStyles.h4,),
          )
        ],
      ),
    );
  }
}