import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_period_filter.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';

class PeriodFilter extends StatelessWidget {
  PeriodFilter({Key? key}) : super(key: key);

  final periodDays = DataPeriodFilter().periodDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...periodDays.map((e) => Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: AppColors.textPrimary,
                          onSurface: Colors.blueGrey),
                      onPressed: () {},
                      child: Text(e.days)),
                ),
              ],
            ))
      ],
    );
  }
}
