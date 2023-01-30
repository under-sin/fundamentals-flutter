import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String responseText;

  // forma de receber uma function como propriedade
  final void Function() onSelected;

  Response(this.responseText, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        responseText,
      ),
      onPressed: onSelected,
    );
  }
}
