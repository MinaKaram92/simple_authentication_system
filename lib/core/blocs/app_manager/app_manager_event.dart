part of 'app_manager_bloc.dart';

class AppManagerEvent extends Equatable {
  const AppManagerEvent();

  @override
  List<Object> get props => [];
}

class SplashViewEvent extends AppManagerEvent {}

class OnboardingViewEvent extends AppManagerEvent {}

class UserAuthStartedEvent extends AppManagerEvent {}
