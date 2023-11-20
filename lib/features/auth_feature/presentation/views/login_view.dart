// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:authentication_system_flutter/core/custom_widgets/custom_material_button.dart';
import 'package:authentication_system_flutter/core/custom_widgets/custom_text_form_field.dart';
import 'package:authentication_system_flutter/core/utils/app_router.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/login_with_email_password_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: BlocListener<UserAuthCubit, UserAuthStates>(
            listener: (context, state) {
              if (state is UserAuthenticationSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouter.homeView,
                  (route) => false,
                );
              } else if (state is UserAuthenticationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
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
                Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: CustomMaterialButton(
                        pressed: () {
                          BlocProvider.of<UserAuthCubit>(context)
                              .authenticateUser(
                                  LoginWithEmailAndPasswordCommand(
                                      email: emailController.text,
                                      password: passwordController.text));
                        },
                        text: 'Login',
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRouter.registerView);
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
    );
  }
}
