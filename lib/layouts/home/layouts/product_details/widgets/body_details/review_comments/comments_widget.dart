import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smart_ecommerce/core/utils/assets.dart';
import 'package:smart_ecommerce/data/models/product_details_model/reviews_models/review_model.dart';

class CommentsWidget extends StatelessWidget {
  final ReviewModel comment;
  const CommentsWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    DateTime? date;
    try {
      date = DateFormat('yyyy-MM-dd HH:mm').parse(comment.createdAt);
    } catch (_) {
      date = DateTime.now();
    }
    final formattedDate = DateFormat('dd MMM yyyy • hh:mm a').format(date);

    final theme = Theme.of(context);

    final buyerNameStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.onSurface,
      letterSpacing: 0.2,
      fontSize: 16,
    );

    final dateStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withAlpha((0.6 * 255).toInt()),
      letterSpacing: 0.1,
      fontSize: 11,
    );

    final commentTextStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400,
      height: 1.6,
      fontSize: 15,
      color: theme.colorScheme.onSurface,
    );

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.94, end: 1),
      curve: Curves.easeOutBack,
      duration: const Duration(milliseconds: 450),
      builder: (context, value, child) {
        final opacityVal = value.clamp(0.0, 1.0);
        return Opacity(
          opacity: opacityVal,
          child: Transform.scale(
            scale: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withAlpha((255 * 0.1).toInt()),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primaryContainer.withAlpha(
                                    (255 * 0.6).toInt(),
                                  ),
                                  theme.colorScheme.secondaryContainer
                                      .withAlpha((255 * 0.4).toInt()),
                                ],
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  theme.colorScheme.surfaceContainerHighest,
                              child: Icon(
                                Icons.person,
                                size: 28,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comment.buyerName, style: buyerNameStyle),
                                Text(formattedDate, style: dateStyle),
                                SizedBox(height: 4),
                                Row(
                                  children: List.generate(5, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 1.5,
                                      ),
                                      child: SvgPicture.asset(
                                        index < comment.rating
                                            ? Assets.assetsImagesActaivStar
                                            : Assets.assetsImagesUnCheckedStar,
                                        height: 17,
                                        width: 17,
                                        colorFilter: ColorFilter.mode(
                                          index < comment.rating
                                              ? theme.colorScheme.primary
                                              : theme.colorScheme.onSurface
                                                  .withAlpha(
                                                    (0.3 * 255).toInt(),
                                                  ),
                                          BlendMode.srcIn,
                                        ),
                                        semanticsLabel:
                                            index < comment.rating
                                                ? 'Filled star'
                                                : 'Empty star',
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Text(comment.comment, style: commentTextStyle),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
