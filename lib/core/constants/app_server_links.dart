class AppServerLinks {
  static const String serverUrl =
      "https://boga.freewebhostmost.com/ecommerceapiapp";

  // Images Path
  static const String categoriesImagesPath = "$serverUrl/upload/categories/";
  static const String itemsImagesPath = "$serverUrl/upload/items/";

  // Auth
  static const String signupUrl = "$serverUrl/auth/signup.php";
  static const String loginUrl = "$serverUrl/auth/login.php";
  static const String verfiyCodeUrl = "$serverUrl/auth/verfiycode.php";
  static const String forgetPassUrl = "$serverUrl/auth/forgetpassword.php";
  static const String resetPassVerfiyUrl =
      "$serverUrl/auth/resetpasswordverify.php";
  static const String resetPasssuccessUrl =
      "$serverUrl/auth/resetpasswordsuccess.php";

  // Home
  static const String homePageUrl = "$serverUrl/home.php";
  static const String itemsUrl = "$serverUrl/items/items.php";

  // Cart
  static const String viewCart = "$serverUrl/cart/view.php";

  // Profile
  static const String viewFavorites = "$serverUrl/favorites/view.php";
  static const String addFavorite = "$serverUrl/favorites/add.php";
  static const String removeFavorite = "$serverUrl/favorites/remove.php";
}
