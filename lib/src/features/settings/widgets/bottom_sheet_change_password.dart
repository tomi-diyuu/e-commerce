import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/forms/input.dart';
import 'package:flutter/material.dart';

class XBottomSheetChangePassword extends StatelessWidget {
  const XBottomSheetChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    const sizedbox = SizedBox(
      height: 5,
    );

    final textStyle = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height * 0.6,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Password Change',
                style: textStyle.titleLarge,
              ),
              sizedbox,
              XInput(
                obscureText: true,
                value: "",
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Old password",
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        // const radius = Radius.circular(34);
                        // showModalBottomSheet<void>(
                        //     isScrollControlled: true,
                        //     context: context,
                        //     shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //             topLeft: radius, topRight: radius)),
                        //     backgroundColor: AppColors.background,
                        //     builder: (BuildContext context) {
                        //       return const XBottomSheetResetPassword();
                        //     });
                      },
                      child:
                          Text("Forgot Password", style: textStyle.labelLarge)),
                ),
              ),
              XInput(
                obscureText: true,
                value: "",
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "New password"),
              ),
              XInput(
                obscureText: true,
                value: "",
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Repeat password"),
              ),
              sizedbox,
              XButton(
                type: ButtonType.elevated,
                onPressed: () {},
                text: "SAVE PASSWORD",
                size: MButtonSize.primary(width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
