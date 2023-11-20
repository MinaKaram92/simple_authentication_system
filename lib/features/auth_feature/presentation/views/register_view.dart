import 'package:authentication_system_flutter/core/custom_widgets/custom_material_button.dart';
import 'package:authentication_system_flutter/core/custom_widgets/custom_text_form_field.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/auth_commands/create_with_email_password_command.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/models/user_model.dart';
import 'package:authentication_system_flutter/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/auth_cubit/auth_states.dart';
import 'package:authentication_system_flutter/features/auth_feature/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: BlocListener<UserAuthCubit, UserAuthStates>(
            listener: (context, state) {
              if (state is UserAuthenticationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('you registered successfully'),
                    backgroundColor: Colors.red,
                  ),
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
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 30.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
                  child: CustomTextFormFeild(
                    prefix: Icons.person,
                    label: 'Name',
                    controller: nameController,
                  ),
                ),
                CustomTextFormFeild(
                  prefix: Icons.email,
                  label: 'Email',
                  controller: emailController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomTextFormFeild(
                    prefix: Icons.lock,
                    label: 'Password',
                    controller: passwordController,
                  ),
                ),
                CustomTextFormFeild(
                  prefix: Icons.phone,
                  label: 'Phone',
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Builder(builder: (context) {
                  return CustomMaterialButton(
                    pressed: () {
                      BlocProvider.of<UserAuthCubit>(context).authenticateUser(
                        CreateUserWithEmailAndPasswordCommand(
                            UserModel(
                                email: emailController.text,
                                name: nameController.text,
                                phone: phoneController.text),
                            passwordController.text),
                      );
                    },
                    text: 'Signup',
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
