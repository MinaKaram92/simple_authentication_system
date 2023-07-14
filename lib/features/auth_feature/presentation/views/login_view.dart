// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:authentication_system_flutter/core/custom_widgets/custom_material_button.dart';
import 'package:authentication_system_flutter/core/custom_widgets/custom_text_form_field.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(AuthRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: BlocListener<LoginCubit, LoginStates>(
              listener: (context, state) {
                if (state is SuccessLoginState) {
                  GoRouter.of(context).go(AppRouter.homeView);
                } else if (state is FailureLoginState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
                    child: CustomTextFormFeild(
                      prefix: Icons.email,
                      label: 'Email',
                      controller: emailController,
                    ),
                  ),
                  CustomTextFormFeild(
                    prefix: Icons.lock,
                    label: 'Password',
                    controller: passwordController,
                  ),
                  Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CustomMaterialButton(
                        pressed: () async {
                          await BlocProvider.of<LoginCubit>(context)
                              .loginWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                        text: 'Login',
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.registerView);
                        },
                        child: Text('Register Now'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
