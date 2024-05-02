import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int defaultMaxLines;
  final int expandMaxLines;
  final Color textColor;
  final Color expandTextColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String showLessText;
  final String showMoreText;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.defaultMaxLines = 3,
    this.expandMaxLines = 1000, // Setting a high value to expand fully
    this.textColor = Colors.black87,
    this.expandTextColor = Colors.blue,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12.5,
    this.showLessText = 'Show Less',
    this.showMoreText = 'Show More',
  });

  @override
  ExpandableTextWidgetState createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.text(
          text: widget.text,
          maxLines:
              _isExpanded ? widget.expandMaxLines : widget.defaultMaxLines,
          overflow: TextOverflow.ellipsis,
          color: widget.textColor,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Material(
            child: InkWell(
              splashColor: Colors.grey[300],
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: CustomText.text(
                text: _isExpanded ? widget.showLessText : widget.showMoreText,
                color: widget.expandTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
