class EndPoints {
  static const String loginEndPoint = 'Auth/login';
  static const String getFilteredProducts = "Products/GetFilteredProducts";
  static const String signupEndPoint = 'Auth/signin';
  static const String getProductDetailsEndPoint = 'Products/GetProductById';
  static const String addToCartEndPoint = "Cart/AddToCart";
  static const String getCartEndPoint = "Cart/GetUserCart";
  static const String getAllCategoryEndPoint = "Category/GetAllCategory";
  static const String getSubCategoryfromCategoryEndPoint = "Category/GetSubCategoryByCategory";
  static const String sendChatMessageEndPoint = "https://saleschatbot.up.railway.app/chat";
  static const String getRecommendedList = "recommend_list";
  // whislist endpoints
  static const String addToWhislistEndPoint = "Wishlist/AddProduct";
  static const String removeFromWhislistEndPoint = "Wishlist/RemoveProduct";
  static const String getWhislistEndPoint = "Wishlist/GetUserProducts";
}
