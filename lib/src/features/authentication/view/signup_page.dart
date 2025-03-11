import 'package:e_commerce/packages/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:e_commerce/src/features/authentication/bloc/signup_bloc.dart';
import 'package:e_commerce/src/features/authentication/view/widgets/bottom_sign.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/button/text_button.dart';
import 'package:e_commerce/widgets/forms/input.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:e_commerce/widgets/screen/screen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = 8.0;
    return BlocConsumer<SignupBloc, SignupState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(),
          body: SafeArea(
            child: DismissKeyBoard(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: XScreenPadding(
                  mediaQuery: MediaQuery.of(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XHeader(title: "Sign up"),
                      const SizedBox(
                        height: 73,
                      ),
                      XInput(
                        value: state.name.value,
                        onChanged: (value) {
                          context
                              .read<SignupBloc>()
                              .add(SignupNameChanged(value));
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Name",
                            errorText: state.name.errorOf(context)),
                      ),
                      const SizedBox(
                        height: space,
                      ),
                      XInput(
                        value: state.email.value,
                        onChanged: (value) {
                          context
                              .read<SignupBloc>()
                              .add(SignupEmailChanged(value));
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
                              .read<SignupBloc>()
                              .add(SignupPasswordChanged(value));
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Password",
                            errorText: state.password.errorOf(context)),
                      ),
                      _buildHaveAccount(context),
                      const SizedBox(
                        height: space * 4,
                      ),
                      XButton(
                        size: MButtonSize.primary(width: double.infinity),
                        type: ButtonType.elevated,
                        text: 'SIGN UP',
                        busy: state.status.isInProgress,
                        onPressed: state.isValidated
                            ? () =>
                                context.read<SignupBloc>().add(SignupSumitted())
                            : null,
                      ),
                      const Spacer(),
                      XBottomSign(title: 'Or sign up with social account')
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status.isSuccess) {
          AppCoordinator.pop();
        }
      },
    );
  }

  Widget _buildHaveAccount(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: XTextButton(
          text: "Already have an account?",
          icon: Icons.arrow_forward,
          onPressed: () => AppCoordinator.showSignInScreen()),
    );
  }
}
