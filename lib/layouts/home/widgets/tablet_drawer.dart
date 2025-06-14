import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_ecommerce/core/resuebale_componants/headline_text.dart';
import '../../../core/utils/assets.dart';
import '../provider/home_provider.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const LinearBorder(),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            const Headlinetext(text: "Options"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  selectedCategory(
                    imagePath: Assets.assetsIconsHomeIcon,
                    context: context,
                    title: "Home",
                    index: 0,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsCompareIcon,
                    context: context,
                    title: 'Compare',
                    index: 1,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsSavedIcon,
                    context: context,
                    title: "Saved",
                    index: 2,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsCartIcon,
                    context: context,
                    title: "Cart",
                    index: 3,
                  ),
                  const SizedBox(height: 20),
                  selectedCategory(
                    imagePath: Assets.assetsIconsAccountIcon,
                    context: context,
                    title: "Account",
                    index: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Headlinetext(text: "Category"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  selectedOption(
                    imagePath: Assets.assetsIconsAllCategory,
                    context: context,
                    title: "All",
                    index: 0,
                  ),
                  // const SizedBox(height: 8),
                  // ...Categorys.categoryList.map(
                  //   (e) => Padding(
                  //     padding: const EdgeInsets.only(bottom: 8),
                  //     child: selectedOption(
                  //       imagePath: e.image,
                  //       context: context,
                  //       title: e.label,
                  //       index: e.index,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedCategory({
    required String imagePath,
    required BuildContext context,
    required String title,
    required int index,
  }) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    bool isSelected = (provider.homeTapIndex == index);
    return GestureDetector(
      onTap: () => provider.changeHomeTapIndex(newValue: index),
      child: Row(
        children: [
          SizedBox(
            height: isSelected ? 30 : 20,
            width: isSelected ? 30 : 20,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color:
                    isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                fontSize: isSelected ? 22 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedOption({
    required String imagePath,
    required BuildContext context,
    required String title,
    required int index,
  }) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    bool isSelected = (provider.selectedCatedgoryIndex == index);
    return GestureDetector(
      onTap: () => provider.changeSelectedCatedgoryIndex(newValue: index),
      child: Row(
        children: [
          SizedBox(
            height: isSelected ? 30 : 20,
            width: isSelected ? 30 : 20,
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color:
                    isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                fontSize: isSelected ? 22 : 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
