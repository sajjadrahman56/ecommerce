class Urls {
  static const String _baseUrl = "http://ecom-api.teamrabbil.com/api";

  static String sendEmailOtp(String email) => "$_baseUrl/UserLogin/$email";

  static String verifyOtp(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";

  static String readProfile = "$_baseUrl/ReadProfile";

  static String createProfile = "$_baseUrl/CreateProfile";
  static String homeBannerSlider = "$_baseUrl/ListProductSlider";
  static String categoryList = "$_baseUrl/CategoryList";
  static String brandyList = "$_baseUrl/BrandList";
  static String popularProduct = "$_baseUrl/ListProductByRemark/Popular";
  static String specialProduct = "$_baseUrl/ListProductByRemark/Special";
  static String newProduct = "$_baseUrl/ListProductByRemark/New";

  static String listProductByCategory(int id) =>
      "$_baseUrl/ListProductByCategory/$id";

  static String productDetails(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";

  static String addToCart = "$_baseUrl/CreateCartList";
  static String cartList = "$_baseUrl/CartList";
  static String deleteCartList(int id) => "$_baseUrl/DeleteCartList/$id";
  static String addToWishList(int id) => "$_baseUrl/CreateWishList/$id";
  static String wishList = "$_baseUrl/ProductWishList";
  static String removeWishList(int id) => "$_baseUrl/RemoveWishList/$id";
  static String listReviewByProduct(int id) =>
      "$_baseUrl/ListReviewByProduct/$id";
  static String addReview = "$_baseUrl/CreateProductReview";
  static String invoiceCreate = "$_baseUrl/InvoiceCreate";
}
