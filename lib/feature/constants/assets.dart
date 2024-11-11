class CustomAssets {
  static final String onboardImage1 = _imagesPath("onboard_image_1.json");
  static final String onboardImage2 = _imagesPath("onboard_image_2.json");
  static final String onboardImage3 = _imagesPath("onboard_image_3.json");
  static final String onboardBackground = _imagesPath("canva2.png");
}

String _imagesPath(String assetName) {
  return "assets/images/$assetName";
}
