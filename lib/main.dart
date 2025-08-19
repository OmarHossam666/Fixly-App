import 'package:fixly/fixly_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const FixlyApp());
}

