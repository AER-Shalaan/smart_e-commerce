import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notification_settings_cubit/notification_settings_cubit.dart';
import '../../cubits/notification_settings_cubit/notification_settings_state.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          size: 33,
          color: theme.iconTheme.color,
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: theme.textTheme.headlineSmall?.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
          builder: (context, state) {
            if (state is NotificationSettingsLoaded) {
              return ListView(
                children: state.settings.entries.map((entry) {
                  return Column(
                    children: [
                      SwitchListTile(
                        title: Text(
                          entry.key,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: entry.value,
                        activeColor: theme.colorScheme.primary,
                        thumbColor: WidgetStatePropertyAll(
                          theme.colorScheme.onPrimary,
                        ),
                        activeTrackColor: theme.colorScheme.primary.withAlpha(160),
                        dense: true,
                        onChanged: (value) {
                          context
                              .read<NotificationSettingsCubit>()
                              .toggleSetting(entry.key);
                        },
                      ),
                      Divider(color: theme.dividerColor),
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
