import 'package:flutter/material.dart';

Future<void> showNetworkErrorDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Network Error"),
      content: Text("Please check your internet connection and try again."),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text("Ok",style: Theme.of(context).textTheme.titleLarge,),
        ),
      ],
    ),
  );
}
