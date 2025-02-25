
import '../../../../../../../core/utils/assets.dart';

class Brand {
  final int id;
  final String name;
  final int subcategoryId;
  final String iconPath;

  Brand({
    required this.id,
    required this.name,
    required this.subcategoryId,
    required this.iconPath,
  });

  static List<Brand> dummyBrands = [
    Brand(
        id: 1,
        name: 'Samsung',
        subcategoryId: 1,
        iconPath: Assets.assetsIconsSamsungIcon),
    Brand(
        id: 2,
        name: 'Apple',
        subcategoryId: 1,
        iconPath: Assets.assetsIconsAppleIcon),
    Brand(
        id: 3,
        name: 'Dell',
        subcategoryId: 2,
        iconPath: Assets.assetsIconsDellIcon),
    Brand(
        id: 4,
        name: 'HP',
        subcategoryId: 2,
        iconPath: Assets.assetsIconsHpIcon),
    Brand(
        id: 5,
        name: 'Nike',
        subcategoryId: 3,
        iconPath: Assets.assetsIconsNikeIcon),
    Brand(
        id: 6,
        name: 'Adidas',
        subcategoryId: 5,
        iconPath: Assets.assetsIconsAdidasIcon),
    Brand(
        id: 8,
        name: 'Bose',
        subcategoryId: 4,
        iconPath: Assets.assetsIconsSamsungIcon),
    Brand(
        id: 7,
        name: 'Sony',
        subcategoryId: 4,
        iconPath: Assets.assetsIconsSonyLogoIcon),
    Brand(
        id: 9,
        name: 'IKEA',
        subcategoryId: 6,
        iconPath: Assets.assetsIconsIkea),
    Brand(
        id: 10,
        name: 'Lenovo',
        subcategoryId: 8,
        iconPath: Assets.assetsIconsLenovoLogoIcon),
  ];
}
