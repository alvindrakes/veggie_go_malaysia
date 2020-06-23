import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  const CustomListTile(
      {Key key,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.onTap})
      : super(key: key);

  @override
  _StatefulStateCupertino createState() => _StatefulStateCupertino();
}

class _StatefulStateCupertino extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            widget.leading,
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.title != null
                    ? Text(widget.title,
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 14.0))
                    : SizedBox(),
                widget.subtitle != null
                    ? Text(widget.subtitle,
                        style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontSize: 12.0,
                        ))
                    : SizedBox(),
              ],
            ),
            Expanded(child: SizedBox()),
            widget.trailing != null ? widget.trailing : SizedBox(),
          ],
        ),
      ),
    );
  }
}
