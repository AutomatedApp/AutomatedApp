

import 'package:flutter/cupertino.dart';
extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
extension mediaQueryExtension  on BuildContext{
  double get height=>MediaQuery.of(this).size.height;
  double get width=>MediaQuery.of(this).size.width;
  double get h=>MediaQuery.of(this).size.width;
  double get leftpadding=>MediaQuery.of(this).viewPadding.left;
  double get rightpadding=>MediaQuery.of(this).viewPadding.right;
  double get toppadding=>MediaQuery.of(this).viewPadding.top;
  double get bottompadding=>MediaQuery.of(this).viewPadding.bottom;


}