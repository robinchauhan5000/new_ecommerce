import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../main.dart';

var getBusinessValue;

class ActionSheet {
  Widget actionSheet(
    BuildContext context, {
    Function onCamera,
    Function onGallery,
  }) {
    return CupertinoActionSheet(
      title: Text(
        "Shopping Cart",
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            onCamera();
          },
          child: Text('Camera', ),
          isDefaultAction: true,
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            onGallery();
          },
          child: Text('Gallery', ),
          isDefaultAction: true,
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
           Navigator.pop(context);
          },
          child: Text(
            'Cancel',
                      )),
    );
  }
}


