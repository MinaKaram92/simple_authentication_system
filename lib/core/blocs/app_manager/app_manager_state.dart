part of 'app_manager_bloc.dart';

class AppManagerState extends Equatable {
  const AppManagerState();

  @override
  List<Object> get props => [];
}

class AppManagerInitialState extends AppManagerState {}

class SplashViewState extends AppManagerState {}

class OnboardingViewState extends AppManagerState {}

class UserAuthLoading extends AppManagerState {}

class UserNotAuthenticated extends AppManagerState {}

class UserAuthenticated extends AppManagerState {
  final User user;

  const UserAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}
