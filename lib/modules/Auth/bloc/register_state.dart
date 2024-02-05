abstract class SocialRegisterState {}
class SocialRegisterInitialState extends SocialRegisterState{}
class SocialRegisterLoadingState extends SocialRegisterState{}
class SocialRegisterSuccessState extends SocialRegisterState{}
class SocialRegisterErrorState extends SocialRegisterState{
  final String error;
  SocialRegisterErrorState(this.error);
}

class SocialChangePasswordVisibilityState extends SocialRegisterState{}

class SocialCreateUserSuccessful extends SocialRegisterState{}

class SocialCreateUserError extends SocialRegisterState{
  final String error;
  SocialCreateUserError(this.error);
}