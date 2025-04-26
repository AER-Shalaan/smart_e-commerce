import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../cubits/notification_settings_cubit/notification_settings_cubit.dart';
import '../../cubits/notification_settings_cubit/notification_settings_state.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 33),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyles.headlineStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
              builder: (context, state) {
                if (state is NotificationSettingsLoaded) {
                  return ListView(
                    children:
                        state.settings.entries.map((entry) {
                          return Column(
                            children: [
                              SwitchListTile(
                                title: Text(
                                  entry.key,
                                  style: TextStyles.accountLabels.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: entry.value,
                                activeColor: AppColors.primary,
                                thumbColor: const WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                                activeTrackColor: AppColors.primary,
                                dense: true,
                                onChanged: (value) {
                                  context
                                      .read<NotificationSettingsCubit>()
                                      .toggleSetting(entry.key);
                                },
                              ),
                              const Divider(),
                            ],
                          );
                        }).toList(),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
      ),
    );
  }
}
