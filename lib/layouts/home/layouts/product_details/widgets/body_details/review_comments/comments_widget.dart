import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(Assets.assetsImagesPersonPhotoAvatar),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yelena Belova",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(Assets.assetsImagesActaivStar),
                      ),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child:
                              SvgPicture.asset(Assets.assetsImagesActaivStar)),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child:
                              SvgPicture.asset(Assets.assetsImagesActaivStar)),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child:
                              SvgPicture.asset(Assets.assetsImagesActaivStar)),
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                              Assets.assetsImagesUnCheckedStar)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "2 weeks ago",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
