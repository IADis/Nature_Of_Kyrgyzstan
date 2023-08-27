import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nature_of_kyrgyzstan/auth/auth_screens/register_screen/register_screen.dart';
import 'package:nature_of_kyrgyzstan/auth/auth_screens/reset_password_screen/reset_screen.dart';
import 'package:nature_of_kyrgyzstan/auth/bloc/auth_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/app_images.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/bottom_text.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/button_widget.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/divider.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/google_button.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/header_text.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/text_fields.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final isFilled = ValueNotifier<bool>(false);
  bool obscureText = true;

  @override
  void dispose() {
    isFilled.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppImages.loginBg,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(
                    text: 'Войти',
                  ),
                  TextFieldWidget(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'ПОЧТА',
                    controller: _emailController,
                    onChanged: (value) {
                      eButton();
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    labelText: 'ПАРОЛЬ',
                    obscureText: obscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscureText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    controller: _passwordController,
                    onChanged: (value) {
                      eButton();
                    },
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            child: const ResetPasswordScreen(),
                            duration: const Duration(seconds: 1),
                            reverseDuration: const Duration(seconds: 1),
                          ),
                        ),
                        child: Text(
                          'Забыли пароль?',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is ErrorAuthState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ValueListenableBuilder(
                          valueListenable: isFilled,
                          builder: (context, _, __) {
                            return ButtonWidget(
                              isLoading: state is LoadingAuthState,
                              isFullFilled: isFilled.value,
                              onPressed: () =>
                                  BlocProvider.of<AuthBloc>(context).add(
                                SignIn(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                              text: 'Войти'.toUpperCase(),
                            );
                          });
                    },
                  ),
                  const SizedBox(height: 20),
                  const DividerWidget(),
                  const SizedBox(height: 20),
                  const GoogleButton(),
                  const SizedBox(height: 20),
                  BottomText(
                    textOne: 'Нет учётной записи?',
                    show: () => Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(seconds: 1),
                          reverseDuration: const Duration(seconds: 1),
                          child: const RegisterScreen(),
                          type: PageTransitionType.fade),
                    ),
                    textTwo: 'Зарегистрироваться',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  eButton() {
    if ([
      _emailController,
      _passwordController,
    ].every((e) => e.text.length >= 6)) {
      isFilled.value = true;
      if (_emailController.text.contains('@')) {
      } else {
        isFilled.value = false;
      }
    } else {
      isFilled.value = false;
    }
  }
}
