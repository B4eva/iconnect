import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/text_styles.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const AppText.headlineOne(this.text) : style = heading1Style;

  const AppText.headlineTwo(
    this.text,
  ) : style = heading2Style;

  const AppText.headlineThree(
    this.text,
  ) : style = heading3Style;

  const AppText.headline(
    this.text,
  ) : style = headlineStyle;

  const AppText.bodyText(this.text, Key? key)
      : style = bodyStyle,
        super(key: key);
  const AppText.subheading(this.text, Key? key)
      : style = subheadingStyle,
        super(key: key);
  const AppText.caption(
    this.text,
  ) : style = captionStyle;

  const AppText.extraSmallText(
    this.text,
  ) : style = extraSmallStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
