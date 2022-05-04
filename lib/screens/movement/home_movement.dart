import 'package:flutter/material.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';

class HomeMovement extends StatefulWidget {
  const HomeMovement({Key? key}) : super(key: key);

  @override
  State<HomeMovement> createState() => _HomeMovementState();
}

class _HomeMovementState extends State<HomeMovement> {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background);
  }
}
