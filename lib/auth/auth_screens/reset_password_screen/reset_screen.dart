import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/bloc/auth_bloc.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/app_images.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/button_widget.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/header_text.dart';
import 'package:nature_of_kyrgyzstan/auth/widgets/text_fields.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final isFilled = ValueNotifier<bool>(false);
  String? errorText;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppImages.resetBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderText(
                  text: 'Забыли пароль?',
                  descriptonText:
                      'Пожалуйста, введите свой зарегистрированный адрес электронной почты, чтобы выслать на него ссылку с сбросом текущего пароля.'),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: TextFieldWidget(
                  labelText: 'ПОЧТА',
                  errorText: errorText,
                  controller: _emailController,
                  onChanged: (value) {
                    emtyButton();
                  },
                ),
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessAuthState) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            alignment: Alignment.topCenter,
                            icon: const Icon(
                              Icons.telegram,
                              size: 60,
                            ),
                            content: Text(state.text));
                      },
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
                        onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                          ResetPassword(email: _emailController.text),
                        ),
                        text: 'Сбросить пароль'.toUpperCase(),
                      );
                    },
                  );
                },
              ),
              Center(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  emtyButton() {
    if ([
      _emailController,
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
