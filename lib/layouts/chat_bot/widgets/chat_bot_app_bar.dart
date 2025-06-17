import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';

class ChatBotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
      elevation: 2,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: theme.colorScheme.primary.withAlpha(180),
            child: SvgPicture.asset(
              Assets.assetsIconsChatBot,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "Shopping assistant",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.textTheme.titleMedium?.color ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
