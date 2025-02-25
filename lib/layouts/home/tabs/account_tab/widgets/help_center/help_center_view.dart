import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/text_styles.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> helpOptions = [
      {"icon": Assets.assetsIconsHeadphones, "label": "Customer Service"},
      {"icon": Assets.assetsIconsWhatsapp, "label": "Whatsapp"},
      {"icon": Assets.assetsIconsWeb, "label": "Website"},
      {"icon": Assets.assetsIconsFacebook, "label": "Facebook"},
      {"icon": Assets.assetsIconsTwitter, "label": "Twitter"},
      {"icon": Assets.assetsIconsInstagram, "label": "Instagram"},
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 33),
          centerTitle: true,
          title: Text("Help Center",
              style: TextStyles.headlineStyle.copyWith(fontSize: 24)),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: ListView.builder(
            itemCount: helpOptions.length,
            itemBuilder: (context, index) {
              return _buildSortByFilter(
                context,
                helpOptions[index]["icon"]!,
                helpOptions[index]["label"]!,
              );
            },
          ),
        ));
  }

  Widget _buildSortByFilter(
      BuildContext context, String iconpath, String label) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(screenWidth * 0.04),
        margin: EdgeInsets.all(screenHeight * 0.01),
        child: Row(
          children: [
            SvgPicture.asset(iconpath),
            SizedBox(width: screenWidth * 0.05),
            Text(
              label,
              style: TextStyles.accountLabels,
            )
          ],
        ),
      ),
    );
  }
}
