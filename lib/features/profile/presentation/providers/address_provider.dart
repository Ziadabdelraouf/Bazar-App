import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AddressType {
  home,
  office,
}

class AddressState {
  final AddressType type;
  final String addressTitle;
  final String fullAddress;

  const AddressState({
    this.type = AddressType.home,
    this.addressTitle = '',
    this.fullAddress = '',
  });

  AddressState copyWith({
    AddressType? type,
    String? addressTitle,
    String? fullAddress,
  }) {
    return AddressState(
      type: type ?? this.type,
      addressTitle: addressTitle ?? this.addressTitle,
      fullAddress: fullAddress ?? this.fullAddress,
    );
  }
}

class AddressNotifier extends Notifier<AddressState> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final fullAddressController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AddressState build() {
    titleController.addListener(_onTextChanged);
    fullAddressController.addListener(_onTextChanged);

    ref.onDispose(() {
      titleController.removeListener(_onTextChanged);
      fullAddressController.removeListener(_onTextChanged);
      titleController.dispose();
      fullAddressController.dispose();
    });

    return const AddressState();
  }

  void _onTextChanged() {
    state = state.copyWith(
      addressTitle: titleController.text,
      fullAddress: fullAddressController.text,
    );
  }

  void selectType(AddressType type) {
    state = state.copyWith(type: type);
  }

  Future<bool> submit() async {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      return false;
    }

    final user = _auth.currentUser;

    if (user == null) {
      debugPrint('No logged-in user found.');
      return false;
    }

    final title = titleController.text.trim();
    final fullAddress = fullAddressController.text.trim();


    final type = state.type == AddressType.home
        ? 'home'
        : 'office';

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('addresses')
          .add({
        'type': type,
        'title': title,
        'fullAddress': fullAddress,
      });

      debugPrint('Address saved successfully.');

      return true;
    } catch (e) {
      debugPrint('Error saving address: $e');
      return false;
    }
  }
}

final addressProvider =
    NotifierProvider<AddressNotifier, AddressState>(
  AddressNotifier.new,
);