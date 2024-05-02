import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class ExpandableWidget extends StatefulWidget {
  final List<Widget> initialColumn1Widgets;
  final List<Widget> initialColumn2Widgets;
  final String showLess;
  final String showMore;

  const ExpandableWidget({
    super.key,
    required this.initialColumn1Widgets,
    required this.initialColumn2Widgets,
    this.showLess = 'Show less',
    this.showMore = 'Show more',
  });

  @override
  ExpandableWidgetState createState() => ExpandableWidgetState();
}

class ExpandableWidgetState extends State<ExpandableWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.initialColumn1Widgets,
        ),
        if (_isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.initialColumn2Widgets,
          ),
        if (!_isExpanded && widget.initialColumn2Widgets.isNotEmpty)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText.text(
                    text: widget.showMore, color: Colors.blue),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        if (_isExpanded)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText.text(text:widget.showLess, color: Colors.blue),
              ],
            ),
          ),
      ],
    );
  }
}
