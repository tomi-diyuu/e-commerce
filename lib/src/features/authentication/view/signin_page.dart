import 'package:e_commerce/packages/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:e_commerce/src/features/authentication/bloc/signin_bloc.dart';
import 'package:e_commerce/src/features/authentication/view/widgets/bottom_sign.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/button/text_button.dart';
import 'package:e_commerce/widgets/forms/input.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:e_commerce/widgets/screen/screen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SigninBloc(),
      child: SigninView(),
    );
  }
}

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = 8.0;
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: DismissKeyBoard(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: XScreenPadding(
                mediaQuery: MediaQuery.of(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    XHeader(title: "Login"),
                    const SizedBox(
                      height: 73,
                    ),
                    XInput(
                      value: state.email.value,
                      onChanged: (value) {
                        context
                            .read<SigninBloc>()
                            .add(SigninEmailChanged(value));
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          errorText: state.email.errorOf(context)),
                    ),
                    const SizedBox(
                      height: space,
                    ),
                    XInput(
                      obscureText: true,
                      value: state.password.value,
                      onChanged: (value) {
                        context
                            .read<SigninBloc>()
                            .add(SigninPasswordChanged(value));
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          errorText: state.password.errorOf(context)),
                    ),
                    _buildForgotPassword(context),
                    const SizedBox(
                      height: space * 4,
                    ),
                    XButton(
                      size: MButtonSize.primary(width: double.infinity),
                      type: ButtonType.elevated,
                      text: 'LOGIN',
                      busy: state.status.isInProgress,
                      onPressed: state.isValidated
                          ? () {
                              context.read<SigninBloc>().add(SigninWithEmail());
                            }
                          : null,
                    ),
                    const Spacer(),
                    XBottomSign(
                      title: 'Or sign in with social account',
                      onClickGoogle: () =>
                          context.read<SigninBloc>().add(SigninWithGoogle()),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: XTextButton(
        text: "Forgot your password",
        icon: Icons.arrow_forward,
        onPressed: () => AppCoordinator.showSignUpScreen(),
      ),
    );
  }
}
