import 'package:equatable/equatable.dart';

sealed class NotificationSettingsState extends Equatable {
  const NotificationSettingsState();

  @override
  List<Object> get props => [];
}

final class NotificationSettingsInitial extends NotificationSettingsState {}

class NotificationSettingsLoaded extends NotificationSettingsState {
  final Map<String, bool> settings;
  const NotificationSettingsLoaded(this.settings);

  @override
  List<Object> get props => [settings];
}
