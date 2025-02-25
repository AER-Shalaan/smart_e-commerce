import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_settings_state.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit()
      : super(const NotificationSettingsLoaded({
          'General Notifications': true,
          'Sound': true,
          'Vibrate': false,
          'Special Offers': true,
          'Promo & Discounts': false,
          'Payments': false,
          'Cashback': true,
          'App Updates': false,
          'New Service Available': false,
          'New Tips Available': false,
        }));

  void toggleSetting(String key) {
    if (state is NotificationSettingsLoaded) {
      final currentState = state as NotificationSettingsLoaded;
      final updatedSettings = Map<String, bool>.from(currentState.settings);
      updatedSettings[key] = !updatedSettings[key]!;
      emit(NotificationSettingsLoaded(updatedSettings));
    }
  }
}
