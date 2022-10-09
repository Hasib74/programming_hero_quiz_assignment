import 'package:flutter/material.dart';
import 'package:programmin_hero/core/utils/app_assets.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image(
              image: AssetImage(AppAssets.logo),
            ),
          ),
          Text(
            "QUIZ",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
