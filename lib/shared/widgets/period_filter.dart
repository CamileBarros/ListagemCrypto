import 'package:flutter/material.dart';
import 'package:listagem_crypto/data_source/data_period_filter.dart';
import 'package:listagem_crypto/shared/themes/app_colors.dart';
import 'package:listagem_crypto/use_cases/model/charts_model.dart';

class PeriodFilter extends StatelessWidget {
  PeriodFilter({Key? key}) : super(key: key);

  final periodDays = DataPeriodFilter().periodDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...periodDays.map((e) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 42,
                    width: 42,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            primary: AppColors.textPrimary,
                            onSurface: Colors.blueGrey),
                        onPressed: () {},
                        child: Text(e.days)),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
