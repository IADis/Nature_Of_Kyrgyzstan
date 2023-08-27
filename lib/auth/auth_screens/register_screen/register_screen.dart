import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/bloc/auth_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/app_images.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/bottom_text.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/header_text.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/text_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confrimPasswordController = TextEditingController();
  final isFullFilled = ValueNotifier<bool>(true);
  bool _obscureText = true;
  String? errorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppImages.registerBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeaderText(text: 'Создайте учетную запись'),
                  TextFieldWidget(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'ПОЧТА',
                    controller: _emailController,
                    onChanged: (value) {
                      emtyButton();
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    labelText: 'ПАРОЛЬ',
                    obscureText: _obscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          _obscureText = !_obscureText;
                        },
                        icon: _obscureText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    controller: _passwordController,
                    onChanged: (v) {
                      emtyButton();
                      if (_confrimPasswordController.text != v) {
                        errorText = 'Пароли не совпадают';
                      } else {
                        errorText = null;
                      }
                      setState(() {});
                    },
                    errorText: errorText,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    obscureText: _obscureText,
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'ПОДТВЕРДИТЕ ПАРОЛЬ',
                    controller: _confrimPasswordController,
                    errorText: errorText,
                    onChanged: (v) {
                      if (_passwordController.text != v) {
                        errorText = 'Пароли не совпадают'.toUpperCase();
                      } else {
                        errorText = null;
                      }
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is ErrorAuthState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              clipBehavior: Clip.antiAlias,
                              content: Text(state.error),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ValueListenableBuilder(
                            valueListenable: isFullFilled,
                            builder: (context, _, __) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: state is LoadingAuthState
                                    ? null
                                    : errorText?.isNotEmpty ?? false
                                        ? null
                                        : isFullFilled.value
                                            ? null
                                            : () {
                                                BlocProvider.of<AuthBloc>(
                                                        context)
                                                    .add(SignUp(
                                                        email: _emailController
                                                            .text,
                                                        password:
                                                            _passwordController
                                                                .text));
                                              },
                                child: state is LoadingAuthState
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'Зарегистрироваться'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                              );
                            });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  BottomText(
                    textOne: 'У вас уже есть учётная запись?',
                    show: () => Navigator.pop(context),
                    textTwo: 'Войти',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  emtyButton() {
    if ([
      _emailController,
      _passwordController,
    ].every((e) => e.text.length >= 6)) {
      isFullFilled.value = false;
      if (_emailController.text.contains('@')) {
      } else {
        isFullFilled.value = true;
      }
    } else {
      isFullFilled.value = true;
    }
  }
}
