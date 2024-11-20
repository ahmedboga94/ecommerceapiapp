import '../../../../core/constants/app_assets.dart';
import '../../models/on_boarding_model.dart';

List<OnBoardingModel> onBoardingDataList = [
  OnBoardingModel(
    title: "Choose Product",
    body:
        "We Have a 100k+ Products Choose\nYour product from our\nE-commerce shop.",
    image: AppAssets.shopping,
  ),
  OnBoardingModel(
    title: "Easy & Sate Payment",
    body:
        "Easy Checkout & Safe Paymentmethod.\nTrusted by our Customers\nfrom all over the world.",
    image: AppAssets.payOnline,
  ),
  OnBoardingModel(
    title: "Track Your Order",
    body:
        "Best Tracker has been Used For Track\nyour order. You will know where\nyour product is at the moment.",
    image: AppAssets.shoppingBags,
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    body:
        "Reliable And Fast Delivery. We\nDeliver your product the fastest\nway possible.",
    image: AppAssets.onTheWay,
  ),
];
