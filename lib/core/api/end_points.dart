class EndPoints {
  static const String loginEndPoint = 'Auth/login';
  static const String getFilteredProducts = "Products/GetFilteredProducts";
  static const String signupEndPoint = 'Auth/signin';
  static const String getProductDetailsEndPoint = 'Products/GetProductById';

  static const String getAllCategoryEndPoint = "Category/GetAllCategory";
  static const String getSubCategoryfromCategoryEndPoint =
      "Category/GetSubCategoryByCategory";
  static const String sendChatMessageEndPoint =
      "https://saleschatbot.up.railway.app/chat";
  static const String getRecommendedList = "recommend_list";
  //comparison endpoints
  static const String addToComparisonEndPoint = "Comparison/AddToComparison";
  static const String removeFromComparisonEndPoint = "Comparison/RemoveFromComparisons";
  static const String getComparisonEndPoint = "Comparison/GetAllComparisons";

  // cart endpoints
  static const String getCartEndPoint = "Cart/GetUserCart";
  static const String addToCartEndPoint = "Cart/AddToCart";
  static const String removeFromCartEndPoint = "Cart/RemoveFromCart";
  static const String updateCartEndPoint = "Cart/UpdateToCart";

  // whislist endpoints
  static const String addToWhislistEndPoint = "Wishlist/AddProduct";
  static const String removeFromWhislistEndPoint = "Wishlist/RemoveProduct";
  static const String getWhislistEndPoint = "Wishlist/GetUserProducts";
  // products endpoints
  static const String addItemViewEndPoint = "Products/AddItemView";
  static const String getProductReviews = "Products/GetProductReviews";
  static const String checkReview = "check_text";
  static const String addProductReview = "Products/AddProductReview";
}
