import 'package:flutter/widgets.dart';

class XScreenPadding extends StatelessWidget {
  const XScreenPadding(
      {super.key, required this.child, required this.mediaQuery});

  final Widget child;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    final size = mediaQuery.size;
    final paddingHori = size.width / 20;
    final paddingTop = mediaQuery.padding.top;
    final height =
        size.height - mediaQuery.padding.bottom - mediaQuery.padding.top;

    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          paddingHori,
          paddingTop,
          paddingHori,
          paddingTop,
        ),
        child: child,
      ),
    );
  }
}
