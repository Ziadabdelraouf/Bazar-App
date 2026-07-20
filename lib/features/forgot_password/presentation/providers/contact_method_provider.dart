import 'package:bazar_group_1/features/forgot_password/domain/contact_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedContactMethodProvider = StateProvider<ContactMethod>(
  (ref) => ContactMethod.email,
);
