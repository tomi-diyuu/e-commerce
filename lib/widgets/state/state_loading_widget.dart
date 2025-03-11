import 'package:flutter/material.dart';

class XStateLoadingWidget extends StatelessWidget {
  const XStateLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
