import 'package:e_commerce/src/themes/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XPromoInput extends StatefulWidget {
  const XPromoInput({
    required this.value,
    super.key,
    this.onChanged,
    this.onClearPromotion,
    this.onPressedArrowIcon,
  });
  final String value;
  final ValueChanged<String>? onChanged;
  final Function()? onClearPromotion;
  final VoidCallback? onPressedArrowIcon;

  @override
  State<XPromoInput> createState() => _XInputState();
}

class _XInputState extends State<XPromoInput> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = false;
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(XPromoInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? buildActions() {
      final List<Widget> actions = [];
      if (value.isNotEmpty) {
        actions.add(
          InkWell(
            onTap: () {
              widget.onChanged?.call('');
              widget.onClearPromotion?.call();
            },
            child: const Icon(Icons.cancel),
          ),
        );
      }

      if (actions.isEmpty) {
        actions.add(
          InkWell(
            onTap: widget.onPressedArrowIcon,
            child: const Icon(Icons.arrow_forward),
          ),
        );
      }
      if (actions.length == 1) {
        return actions[0];
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [AppDecorations.shadow]),
        child: TextFormField(
          readOnly: true,  // prevent user from entering text
          controller: _controller,
          onChanged: widget.onChanged,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          decoration: InputDecoration().copyWith(
              hintText: "Enter your promotion",
              suffixIcon: buildActions(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 22)),
        ),
      ),
    );
  }
}
