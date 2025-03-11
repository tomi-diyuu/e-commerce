import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final Exception exception;

  const ErrorDisplay({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error occurred: $exception'));
  }
}
