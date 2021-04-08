import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {

  const NotificationWidget({
    this.iconColor,
    this.labelColor,
    Key key,
  }) : super(key: key);
  final Color iconColor;
  final Color labelColor;
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 28,
          )
        ],
      ),
    );
  }
}
