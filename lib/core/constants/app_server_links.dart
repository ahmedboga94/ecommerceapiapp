class AppServerLinks {
  static const String serverUrl =
      "https://bogatool.freewebhostmost.com/ecommerceapiapp";

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
}
