import 'package:flutter/cupertino.dart';

import 'colors/app_colors.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  AppColors get color {
    return AppColors();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
