import 'package:e_commerce/src/features/settings/widgets/bottom_sheet_change_password.dart';
import 'package:e_commerce/widgets/bottom_sheet/modal_bottom.dart';
import 'package:e_commerce/widgets/forms/input.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:e_commerce/widgets/screen/screen_padding.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    const space = 20.0;

    return Scaffold(
      appBar: AppBar(),
      body: XScreenPadding(
        mediaQuery: MediaQuery.of(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XHeader(title: "Settings"),
            const SizedBox(
              height: space,
            ),
            // personal information
            Text(
              'Personal Information',
              style: textStyle.titleMedium,
            ),
            const SizedBox(
              height: space,
            ),
            XInput(
              value: "Nguyen Anh Duy",
              onChanged: (value) {},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Full name"),
            ),

            XInput(
              value: "12/12/1989",
              onChanged: (value) {},
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Date of Birth"),
            ),

            // Password section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password',
                  style: textStyle.titleMedium,
                ),
                TextButton(
                    onPressed: () {
                      XModalBottom.showModal(
                          context, XBottomSheetChangePassword());
                    },
                    child: Text(
                      "Change",
                      style: textStyle.labelLarge,
                    ))
              ],
            ),
            const SizedBox(
              height: space,
            ),

            XInput(
              obscureText: true,
              value: "Nguyen Anh Duy",
              onChanged: (value) {},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Password"),
            ),
          ],
        ),
      ),
    );
  }
}
