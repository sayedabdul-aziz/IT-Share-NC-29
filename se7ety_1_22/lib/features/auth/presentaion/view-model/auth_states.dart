class AuthStates {}

class AuthInitState extends AuthStates {}

// login
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState({required this.error});
}

// register
class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState({required this.error});
}

// register
class UploadDoctorLoadingState extends AuthStates {}

class UploadDoctorSuccessState extends AuthStates {}

class UploadDoctorErrorState extends AuthStates {
  final String error;

  UploadDoctorErrorState({required this.error});
}
