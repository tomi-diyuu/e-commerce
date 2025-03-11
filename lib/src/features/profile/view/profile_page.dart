import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/profile/widgets/info_list.dart';
import 'package:e_commerce/src/features/profile/widgets/info_profile.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/widgets/button/text_button.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:e_commerce/widgets/screen/screen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: XScreenPadding(
            mediaQuery: MediaQuery.of(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XHeader(title: "My profile"),
                const SizedBox(
                  height: 24,
                ),
                if (state.isLogin) ...[
                  InfoProfile(
                    name: state.user.name ?? "",
                    email: state.user.email ?? "",
                    image: state.user.avatar ?? "",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // infor list tile
                  InfoList(),
                ] else ...[
                  XTextButton(
                      onPressed: () {
                        AppCoordinator.showSignInScreen();
                      },
                      text: "Sign in / Sign up")
                ]
              ],
            ),
          ),
        );
      },
    ));
  }
}
