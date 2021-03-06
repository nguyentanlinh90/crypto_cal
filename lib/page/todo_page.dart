import 'package:crypto_cal/stateless/input_field.dart';
import 'package:flutter/material.dart';
import 'package:crypto_cal/constants/app_colors.dart';

import '../constants/app_strings.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Text("Todo"),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
