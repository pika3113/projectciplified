import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpandedWidget extends StatefulWidget {
  final String text;
  const ExpandedWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(101, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 235, 235),
      child: secondHalf.length == ''
          ? Text(widget.text)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flag ? firstHalf.trim() + '....' : widget.text,
                  style: TextStyle(
                      fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        flag ? 'Show more' : 'Show less',
                        style: TextStyle(
                            color: Color.fromARGB(255, 131, 96, 255),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                          flag
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Color.fromARGB(255, 131, 96, 255))
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
