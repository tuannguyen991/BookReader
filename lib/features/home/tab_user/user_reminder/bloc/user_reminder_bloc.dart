import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/reminder/reminder_model.dart';
import 'package:demo_book_reader/share/functions/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_reminder_bloc.freezed.dart';
part 'user_reminder_event.dart';
part 'user_reminder_state.dart';

class UserReminderBloc extends Bloc<UserReminderEvent, UserReminderState> {
  UserReminderBloc({required this.userRepository})
      : super(const UserReminderState()) {
    on<UserReminderLoaded>(_onLoaded);
    on<UserReminderNewRequested>(_onNewRequested);
    on<UserReminderDeleteRequested>(_onDeleteRequested);
    on<UserReminderUpdateRequested>(_onUpdateRequested);
  }

  final UserRepository userRepository;

  FutureOr<void> _onLoaded(
      UserReminderLoaded event, Emitter<UserReminderState> emit) async {
    emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    final reminderList = await userRepository.getReminder(token: token);
    emit(state.copyWith(isLoading: false, userReminderList: reminderList));
  }

  FutureOr<void> _onNewRequested(
      UserReminderNewRequested event, Emitter<UserReminderState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    scheduleFunctionExecution();

    final reminderList = await userRepository.createReminder(
        token: token, time: TimeOfDay.fromDateTime(event.time));
    emit(state.copyWith(isLoading: false, userReminderList: reminderList));
  }

  FutureOr<void> _onDeleteRequested(UserReminderDeleteRequested event,
      Emitter<UserReminderState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    scheduleFunctionExecution();

    final reminderList = await userRepository.deleteReminder(
        token: token, reminderId: event.reminderId);
    emit(state.copyWith(isLoading: false, userReminderList: reminderList));
  }

  FutureOr<void> _onUpdateRequested(UserReminderUpdateRequested event,
      Emitter<UserReminderState> emit) async {
    // emit(state.copyWith(isLoading: true));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    scheduleFunctionExecution();

    final reminderList = await userRepository.updateReminder(
        token: token,
        reminderId: event.reminderId,
        time: event.time,
        isActive: event.isActive);
    emit(state.copyWith(isLoading: false, userReminderList: reminderList));
  }
}
