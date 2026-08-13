import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNotification {
  final String title;
  final String body;
  final DateTime receivedAt;

  AppNotification({
    required this.title,
    required this.body,
    required this.receivedAt,
  });
}

class NotificationsNotifier extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() {
    return [];
  }

  void addNotification(String title, String body) {
    state = [
      AppNotification(title: title, body: body, receivedAt: DateTime.now()),
      ...state,
    ];
  }
}

final notificationsProvider =
    NotifierProvider<NotificationsNotifier, List<AppNotification>>(
      NotificationsNotifier.new,
    );
