import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  TabItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.isSelected,
      required this.onPress})
      : super(key: key);
  final bool isSelected;
  final String title;
  final Icon icon;
  final VoidCallback onPress;
  var unSelectColor = Colors.white30;
  var selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var iconColor = isSelected ? selectedColor : unSelectColor;
    var textStyle = TextStyle(
        color: isSelected ? selectedColor : unSelectColor, fontSize: 12);
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(title, style: textStyle),
            )
          ],
        ),
      ),
    );
  }
}
