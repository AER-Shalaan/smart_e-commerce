import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';

class ChatBotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 247, 221, 212),
      elevation: 2,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withAlpha(180),
            child: SvgPicture.asset(
              Assets.assetsIconsChatBot,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Shopping assistant",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
