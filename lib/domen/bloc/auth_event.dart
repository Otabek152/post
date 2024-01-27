part of 'auth_bloc.dart';

@immutable
class AuthEvent {}
class AuthRegister extends AuthEvent{
  AuthRegister({required this.password , required this.firstName , required this.lastName , required this.phoneNumber});
  String firstName , lastName , phoneNumber , password;
}
class AuthAds extends AuthEvent{
  AuthAds({required this.title , required this.description , required this.lat , required this.lot});
  String title , description;
  double lat , lot;
}