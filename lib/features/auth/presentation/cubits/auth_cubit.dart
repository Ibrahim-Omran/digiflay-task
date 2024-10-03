import 'package:bloc/bloc.dart';
import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:digiflay_task/core/database/cache/cache_helper.dart';
import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:digiflay_task/features/auth/data/models/login_model.dart';
import 'package:digiflay_task/features/auth/data/models/sign_up_model.dart';
import 'package:digiflay_task/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepository authRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKeyLogin = GlobalKey<FormState>();
  final formKeySignUp = GlobalKey<FormState>();



  //login method
  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginModel = r;
        // decodedToken
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.accessToken);
        debugPrint(decodedToken.toString());
        // await sl<CacheHelper>().saveData(key: ApiKeys.id, value: decodedToken,);

        //Save Token
        await sl<CacheHelper>().saveData(
          key: ApiKeys.accessToken,
          value: r.accessToken,
        );

        emit(LoginSuccessState());
      },
    );
  }


  // SignUp...
  SignUpModel? signUpModel;
  void signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
          (l) => emit(SignUpErrorState(l)),
          (r) async {
            signUpModel = r;
        emit(SignUpSuccessState());
      },
    );
  }



  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
    isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordSuffixIcon());
  }

  bool isRememberSowing = true;
  IconData rememberIcon = Icons.check_box_outline_blank;

  void changeRememberIcon() {
    isRememberSowing = !isRememberSowing;
    rememberIcon =
    isRememberSowing ? Icons.check_box_outline_blank : Icons.check_box;
    emit(ChangeRememberIcon());
  }

}
