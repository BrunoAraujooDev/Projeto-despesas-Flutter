import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;

  const AdaptativeButton({Key? key, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label!),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : OutlinedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.labelLarge?.color),
            ),
            onPressed: onPressed,
            child: Text(label!),
          );
  }
}
